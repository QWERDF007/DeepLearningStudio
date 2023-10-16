import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./Component"

Rectangle {
    id: _labellingCenter
    width: 400
    height: 600
    clip: true
    color: "transparent"
    border.color: "green"
    border.width: 1

    property bool imageDragEnable: false
    property bool drawing: false
    property real startX: 0
    property real startY: 0
    property color drawingColor: "red"


    Image {
        id: image
        property real minimalEdge: Math.min(parent.width, parent.height)
        property real widthOffset: Math.abs(width - paintedWidth) / 2
        property real heightOffset: Math.abs(height - paintedHeight) / 2
        property real xOffset: x + widthOffset
        property real yOffset: y + heightOffset
        width: parent.width
        height: parent.height
        source: "file:///D:/Datasets/Photos/raw/F3f6LKvW4AAgnDi.jpg"
        sourceSize.width: minimalEdge
        sourceSize.height: minimalEdge
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: _drawingRect
        visible: _labellingCenter.drawing
        color: "transparent"
        border.width: 1
        border.color: _labellingCenter.drawingColor
    }

    MouseArea {
        id: _mouseArea
        anchors.fill: parent
        drag.target: _labellingCenter.imageDragEnable ? image : null
        drag.axis: Drag.XAndYAxis
        acceptedButtons: Qt.AllButtons

        onPressed: function (mouse) {
            _labellingCenter.forceActiveFocus()
            if (mouse.button === Qt.LeftButton) {
                if (mouse.modifiers & Qt.ControlModifier) {
                    setImageDragEnable(true)
                } else {
                    startX = mouse.x
                    startY = mouse.y
                    _drawingRect.width = 0
                    _drawingRect.height = 0
                    _labellingCenter.drawing = true
                }
            } else if (mouse.button === Qt.MiddleButton) {
                setImageDragEnable(true)
            } else if (mouse.button === Qt.RightButton) {

            }
        }

        onReleased: function (mouse) {
            if (_labellingCenter.imageDragEnable) {
                setImageDragEnable(false)
            } else if (mouse.button === Qt.LeftButton) {
                addRect(mouse)
            }
        }

        onPositionChanged: function (mouse) {
//            console.log("mouse move", mouse.x, mouse.y, mapToItem(image, mouse.x, mouse.y))
            if (_labellingCenter.drawing) {
                _drawingRect.width = Math.abs(mouse.x - startX)
                _drawingRect.height = Math.abs(mouse.y - startY)
                _drawingRect.x = Math.min(mouse.x, startX)
                _drawingRect.y = Math.min(mouse.y, startY)
            }
        }
    }

    ListModel {
        id: rectsModel
        ListElement {x: 0; y: 0; width: 80; height: 60; color: "lightblue"; label: "类别1"}
        ListElement {x: 100; y: 20; width: 200; height: 105; color: "yellow"; label: "类别2"}
    }

    EditableRectsRepeater {
        id: editableRects
        model: rectsModel
        xOffset: image.xOffset
        yOffset: image.yOffset
        imagePaintedWidth: image.paintedWidth
        imagePaintedHeight: image.paintedHeight
    }

    function setImageDragEnable(enable) {
        _labellingCenter.imageDragEnable = enable
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
        var left = _drawingRect.x - image.xOffset
        var right = left + _drawingRect.width
        left = Math.max(0, left)
        right = Math.min(right, image.paintedWidth)
        var top = _drawingRect.y - image.yOffset
        var bottom = top + _drawingRect.height
        top = Math.max(0, top)
        bottom = Math.min(bottom, image.paintedHeight)
        var x = left
        var y = top
        var width = right - left
        var height = bottom - top

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
        _labellingCenter.drawing = false
    }
}
