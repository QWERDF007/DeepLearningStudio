import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Repeater {
    id: editableRects
    property real xOffset: 0
    property real yOffset: 0
    property real scaleValue: 1.0
    property real imageSourceWidth: 0
    property real imageSourceHeight: 0
    property real imagePaintedWidth: 0
    property real imagePaintedHeight: 0

    delegate: Rectangle {
        id: _editableRect
        x: model.x * scaleValue + xOffset
        y: model.y * scaleValue + yOffset
        width: model.width * scaleValue
        height: model.height * scaleValue
        color: "transparent"
        border.color:  model.color
        border.width: 1

        property bool rectDragEnable: false

        onXChanged: {
            if (rectDragEnable) {
                var left = Math.max(0, (_editableRect.x - xOffset) / scaleValue )
                var right = Math.max(0, imageSourceWidth)
                model.x = Math.min(left, right)
            }
        }

        onYChanged: {
            if (rectDragEnable) {
                var top = Math.max(0, (_editableRect.y - yOffset) / scaleValue)
                var bottom = Math.max(0, imageSourceHeight)
                model.y = Math.min(top, bottom)
            }
        }

        MouseArea {
            id: _rectMouseArea
//            anchors.fill: parent
            width: parent.width + 5
            height: parent.height + 5
            anchors.centerIn: parent.Center
            hoverEnabled: true
            acceptedButtons: Qt.AllButtons
            drag.target: _editableRect.rectDragEnable ? _editableRect : null
            drag.axis: Drag.XAndYAxis

            drag.minimumX: xOffset
            drag.maximumX: xOffset + imagePaintedWidth - _editableRect.width
            drag.minimumY: yOffset
            drag.maximumY: yOffset + imagePaintedHeight - _editableRect.height

            onPressed: function(mouse) {
                console.log("press on rect")
                if (mouse.button === Qt.LeftButton) {
                    setRectDragEnable(true)
                    setCursorShape(Qt.CrossCursor)
                } else if (mouse.button === Qt.MiddleButton){
//                    _rectMouseArea.cursorShape = Qt.ClosedHandCursor
                    mouse.accepted = false
                } else if (mouse.button === Qt.RightButton) {
                    mouse.accepted = false
                }
            }

            onReleased: function(mouse) {
                console.log("release on rect")
                if (_editableRect.rectDragEnable) {
                    setRectDragEnable(false)
                    setCursorShape(Qt.ArrowCursor)
                }
//                if (_rectMouseArea.cursorShape != Qt.ArrowCursor) {
//                    _rectMouseArea.cursorShape = Qt.ArrowCursor
//                }
            }

            onPositionChanged: function(mouse) {

            }
        }
        function setRectDragEnable(enable) {
            _editableRect.rectDragEnable = enable
        }

        function setCursorShape(cursorShape) {
            _rectMouseArea.cursorShape = cursorShape
        }
    }

}
