import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI


Item {
    id: labelRegion
    width: 600
    height: 400
    property bool imageDragEnable: false
    property bool drawing: false
    property real startX: 0
    property real startY: 0
    property color drawingColor: "red"
    property real stepSize: 0.1
    property real from: 0.25
    property real to: 2

    property var itemUnderMouse: null
    property var scaledImagePos: mapFromItem(image, 0, 0)
    property real imageSourceScale: image.source !== "" && image.status === Image.Ready ?
                                        Math.min(labelRegion.height / image.sourceSize.height, labelRegion.width / image.sourceSize.width) :
                                        1.0

    property bool isFitInView: true

    onVisibleChanged: {
        if (visible) {
            forceActiveFocus()
        }
    }

    Image {
        id: image
        property real xOffset: Math.abs(width - paintedWidth) / 2 * scale
        property real yOffset: Math.abs(height - paintedHeight) / 2 * scale

        source: "file:///D:/Datasets/Photos/raw/F3f6LKvW4AAgnDi.jpg"
        fillMode: Image.PreserveAspectFit

        onXChanged: {
            updateImagePos()
        }
        onYChanged: {
            updateImagePos()
        }
    }

    onWidthChanged: {
        console.log("labelRegion", labelRegion.width, labelRegion.height)
        if (isFitInView) {
            imageFitInView()
        }
    }
    onHeightChanged: {
        console.log("labelRegion", labelRegion.width, labelRegion.height)
        if (isFitInView) {
            imageFitInView()
        }
    }

    Rectangle {
        id: drawingRect
        visible: labelRegion.drawing
        color: "transparent"
        border.width: 1
        border.color: labelRegion.drawingColor
    }

    MouseArea {
        id: _mouseArea
        anchors.fill: parent
        drag.target: labelRegion.imageDragEnable ? image : null
        drag.axis: Drag.XAndYAxis
        hoverEnabled: true
        acceptedButtons: Qt.AllButtons

        Component.onCompleted: {
//            QuickTools.setCursor(this, ":/icons/edit")
        }

        onPressed: function (mouse) {
            labelRegion.forceActiveFocus()
            itemUnderMouse = labelRegion.childAt(mouse.x, mouse.y)
            if (mouse.button === Qt.LeftButton) {
                if (mouse.modifiers & Qt.ControlModifier) {
                    setImageDragEnable(true)
                    setCursorShape(Qt.ClosedHandCursor)
                } else {
                    startDrawingRect(mouse)
                }
            } else if (mouse.button === Qt.MiddleButton) {
                setImageDragEnable(true)
                setCursorShape(Qt.ClosedHandCursor)
            } else if (mouse.button === Qt.RightButton) {

            }
        }

        onReleased: function (mouse) {
            if (labelRegion.imageDragEnable) {
                setImageDragEnable(false)
                if (mouse.modifiers & Qt.ControlModifier) {
                    setCursorShape(Qt.OpenHandCursor)
                } else {
                    setCursorShape(Qt.ArrowCursor)
                    if (itemUnderMouse) {
                        itemUnderMouse = null
                    }
                }
            } else if (mouse.button === Qt.LeftButton) {
                addRect(mouse)
            }
        }

        onPositionChanged: function (mouse) {
            if (labelRegion.drawing) {
                updateDrawingRectByMouse(mouse)
            }
        }

        onWheel: function (wheel) {
            scaleImageByWheel(wheel)
            updateImagePos()
        }
    }


    ListModel {
        id: rectsModel
//        ListElement {x: 0; y: 0; width: 80; height: 60; color: "lightblue"; label: "类别1"}
        ListElement {x: 100; y: 20; width: 200; height: 105; color: "yellow"; label: "类别2"}
    }

    EditableRectsRepeater {
        id: editableRects
        model: rectsModel
        imageSourceWidth: image.sourceSize.width
        imageSourceHeight: image.sourceSize.height
        imagePaintedWidth: image.paintedWidth * image.scale
        imagePaintedHeight: image.paintedHeight * image.scale
        xOffset: labelRegion.scaledImagePos.x + image.xOffset
        yOffset: labelRegion.scaledImagePos.y + image.yOffset
        scaleValue: image.scale
    }


    Keys.onPressed: function (event) {

        if (event.key === Qt.Key_Control) {
            itemUnderMouse = labelRegion.childAt(_mouseArea.mouseX, _mouseArea.mouseY)
            console.log(itemUnderMouse, _mouseArea.mouseX, _mouseArea.mouseY)
            if (!labelRegion.imageDragEnable) {
                setCursorShape(Qt.OpenHandCursor)
            }
        } else if (event.key === Qt.Key_Space) {
            imageFitInView()
        }
    }

    Keys.onReleased: function (event) {
        if (event.key === Qt.Key_Control) {
            if (labelRegion.imageDragEnable) {
                setImageDragEnable(false)
            }
            setCursorShape(Qt.ArrowCursor)
            if (itemUnderMouse) {
                itemUnderMouse = null
            }
        }
    }
    
    /**
     * @brief 设置图片拖拽
     * @param enable
     */
    function setImageDragEnable(enable) {
        labelRegion.imageDragEnable = enable
    }

    /**
     * @brief 设置图片区域的鼠标形状
     * @param cursorShape
     */
    function setCursorShape(cursorShape) {
        _mouseArea.cursorShape = cursorShape
        updateItemUnderMouseCursorShape(cursorShape)
    }

    /**
     * @brief 获取 obj 的属性并转换为字符串, 包括 function 和 property
     * @param obj
     */
    function objToString (obj) {
        var str = '';
        for (var p in obj) {
            if (Object.prototype.hasOwnProperty.call(obj, p)) {
                str += p + '::' + obj[p] + '\n';
            }
        }
        return str;
    }

    /**
     * @brief 设置鼠标位置下的组件的鼠标区域的鼠标形状
     * @param cursorShape
     */
    function updateItemUnderMouseCursorShape(cursorShape) {
        if (itemUnderMouse && itemUnderMouse.hasOwnProperty("cursorShapeChanged")) {
            if (itemUnderMouse instanceof Rectangle) {
                itemUnderMouse.cursorShapeChanged(cursorShape)
            }
        }
    }

    /**
     * @brief 鼠标滚轮缩放图片, 更新图片位置
     * @param wheel
     */
    function scaleImageByWheel(wheel) {
        // 鼠标相对于缩放前图像的位置
        var scaleOrigin = mapToItem(image, wheel.x, wheel.y)
        // 缩放
        var step = wheel.angleDelta.y / 120 * labelRegion.stepSize
        image.scale = Math.min(Math.max(0.25 * labelRegion.imageSourceScale, image.scale + step), 32 * labelRegion.imageSourceScale)
        // 鼠标位置相对于缩放后图像的位置
        var pos = mapFromItem(image, scaleOrigin)
        //按照差值移动一下图，使得图看起来在鼠标位置缩放
        image.x -= pos.x - wheel.x
        image.y -= pos.y - wheel.y
    }

    /**
     * @brief 开始绘制矩形, 记录起始位置, 重置宽高避免上一次矩形遗留
     * @param mouse
     */
    function startDrawingRect(mouse) {
        startX = mouse.x
        startY = mouse.y
        drawingRect.width = 0
        drawingRect.height = 0
        drawing = true
    }

    /**
     * @brief 更新绘制的矩形, 结束绘制
     * @param mouse
     */
    function updateDrawingRectByMouse(mouse) {
        drawingRect.width = Math.abs(mouse.x - startX)
        drawingRect.height = Math.abs(mouse.y - startY)
        drawingRect.x = Math.min(mouse.x, startX)
        drawingRect.y = Math.min(mouse.y, startY)
    }

    /**
     * @brief 更新缩放后的图像起始点
     */
    function updateImagePos() {
        scaledImagePos = mapFromItem(image, 0, 0)
    }

    /**
     * @brief 添加一个矩形, 矩形被限制在图像区域内
     * @param mouse
     */
    function addRect(mouse) {
        var left = (drawingRect.x - (scaledImagePos.x + image.xOffset)) / image.scale
        var right = left + drawingRect.width / image.scale
        left = Math.max(0, left)
        right = Math.min(right, image.paintedWidth)
        var top = (drawingRect.y - (scaledImagePos.y + image.yOffset)) / image.scale
        var bottom = top + drawingRect.height / image.scale
        top = Math.max(0, top)
        bottom = Math.min(bottom, image.paintedHeight)
        var x = left
        var y = top
        var width = right - left
        var height = bottom - top

        if (width > 0 && height > 0) {
            console.log("add one rect", x, y, width, height)
            rectsModel.append({
                                  x: x,
                                  y: y,
                                  width: width,
                                  height: height,
                                  color: "lightblue",
                                  label: "类别1"
                              })
        }
        labelRegion.drawing = false
    }

    function imageFitInView() {
        labelRegion.imageSourceScale = Math.min(labelRegion.height / image.sourceSize.height, labelRegion.width / image.sourceSize.width)
        console.log("imageFitInView image", image.sourceSize, image.scale, labelRegion.imageSourceScale)
        console.log("imageFitInView labelRegion", labelRegion.width, labelRegion.height)
        var scaleOrigin = mapToItem(image, 0, 0)
        image.scale = labelRegion.imageSourceScale
        var dx = (labelRegion.width - image.sourceSize.width * image.scale) / 2
        var dy = (labelRegion.height - image.sourceSize.height * image.scale) / 2
        var pos = mapFromItem(image, scaleOrigin)
        // 按照差值移动一下图，使得图看起来在(0,0)处缩放
        image.x -= pos.x
        image.y -= pos.y
        // 移动到窗口中央
        image.x -= scaledImagePos.x - dx
        image.y -= scaledImagePos.y - dy
    }
}
