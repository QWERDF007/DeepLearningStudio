import QtQuick
import QtQuick.Controls
import QtQuick.Layouts



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

    property var scaleOrigin: mapFromItem(image, 0, 0)
    property var scaledImagePos: mapFromItem(image, 0, 0)
    property real scaleValue: 1.0

    Image {
        id: image
        property real minimalEdge: Math.min(parent.width, parent.height)
        property real xOffset: Math.abs(width - paintedWidth) / 2 * scaleValue
        property real yOffset: Math.abs(height - paintedHeight) / 2 * scaleValue

        width: parent.width
        height: parent.height
        source: "file:///D:/Datasets/Photos/raw/F3f6LKvW4AAgnDi.jpg"
        sourceSize.width: minimalEdge
        sourceSize.height: minimalEdge
        fillMode: Image.PreserveAspectFit
        onXChanged: {
            updateImagePos()
        }
        onYChanged: {
            updateImagePos()
        }
        transform: Scale {
            origin.x: scaleOrigin.x
            origin.y: scaleOrigin.y
            xScale: scaleValue
            yScale: scaleValue
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
        acceptedButtons: Qt.AllButtons

        onPressed: function (mouse) {
            labelRegion.forceActiveFocus()
            if (mouse.button === Qt.LeftButton) {
                if (mouse.modifiers & Qt.ControlModifier) {
                    setImageDragEnable(true)
                } else {
                    startDrawingRect(mouse)
                }
            } else if (mouse.button === Qt.MiddleButton) {
                setImageDragEnable(true)
            } else if (mouse.button === Qt.RightButton) {

            }
        }

        onReleased: function (mouse) {
            if (labelRegion.imageDragEnable) {
                setImageDragEnable(false)
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

    function scaleImageByWheel(wheel) {
        // 鼠标相对于缩放前图像的位置
        scaleOrigin = mapToItem(image, wheel.x, wheel.y)
        // 缩放
        var step = wheel.angleDelta.y / 120 * labelRegion.stepSize
        scaleValue = Math.min(Math.max(0.25, scaleValue + step), 32)
        // 鼠标位置相对于缩放后图像的位置
        var pos = mapFromItem(image, scaleOrigin)
        //按照差值移动一下图，使得图看起来不动
        image.x -= pos.x - wheel.x
        image.y -= pos.y - wheel.y
    }

    function startDrawingRect(mouse) {
        startX = mouse.x
        startY = mouse.y
        drawingRect.width = 0
        drawingRect.height = 0
        drawing = true
    }

    function updateDrawingRectByMouse(mouse) {
        drawingRect.width = Math.abs(mouse.x - startX)
        drawingRect.height = Math.abs(mouse.y - startY)
        drawingRect.x = Math.min(mouse.x, startX)
        drawingRect.y = Math.min(mouse.y, startY)
    }

    function updateImagePos() {
        scaledImagePos = mapFromItem(image, 0, 0)
    }

    ListModel {
        id: rectsModel
//        ListElement {x: 0; y: 0; width: 80; height: 60; color: "lightblue"; label: "类别1"}
        ListElement {x: 100; y: 20; width: 200; height: 105; color: "yellow"; label: "类别2"}
    }

    EditableRectsRepeater {
        id: editableRects
        model: rectsModel
        xOffset: labelRegion.scaledImagePos.x + image.xOffset
        yOffset: labelRegion.scaledImagePos.y + image.yOffset
        scaleValue: labelRegion.scaleValue
    }

    function setImageDragEnable(enable) {
        labelRegion.imageDragEnable = enable
        if (enable) {
            _mouseArea.cursorShape = Qt.ClosedHandCursor
        } else {
            _mouseArea.cursorShape = Qt.ArrowCursor
        }
    }

    Keys.onPressed: function (event) {
        if (event.key === Qt.Key_Control) {
            _mouseArea.cursorShape = Qt.OpenHandCursor
        }
    }

    Keys.onReleased: function (event) {
        if (event.key === Qt.Key_Control) {
            _mouseArea.cursorShape = Qt.ArrowCursor
        }
    }

    function addRect(mouse) {
        var x = (drawingRect.x - (scaledImagePos.x + image.xOffset)) / scaleValue
        var y = (drawingRect.y - (scaledImagePos.y + image.yOffset)) / scaleValue
        var width = drawingRect.width / scaleValue
        var height = drawingRect.height / scaleValue

        console.log("rect", x, y, width, height)

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
}