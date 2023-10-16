import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Repeater {
    id: _editableRects
    property real xOffset: 0
    property real yOffset: 0
    property real imagePaintedWidth: 0
    property real imagePaintedHeight: 0

    delegate: Rectangle {
        id: _editableRect
        x: model.x + xOffset
        y: model.y + yOffset
        width: model.width
        height: model.height
        color: "transparent"
        border.color:  model.color
        border.width: 1

        property bool rectDragEnable: false

        onXChanged: {
            model.x = _editableRect.x - xOffset
            model.x = Math.max(0, model.x)
            model.x = Math.min(model.x, Math.abs(imagePaintedWidth - _editableRect.width))
        }

        onYChanged: {
            model.y = _editableRect.y - yOffset
            model.y = Math.max(0, model.y)
            model.y = Math.min(model.y, Math.abs(imagePaintedHeight - _editableRect.height))
        }

        MouseArea {
            id: _rectMouseArea
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            drag.target: _editableRect.rectDragEnable ? _editableRect : null
            drag.axis: Drag.XAndYAxis
            onPressed: function(mouse) {
                console.log("press on rect")
                if (mouse.button === Qt.LeftButton) {
                    setRectDragEnable(true)
                } else {
                    mouse.accepted = false
                }
            }

            onReleased: function(mouse) {
                console.log("release on rect")
                if (_editableRect.rectDragEnable) {
                    setRectDragEnable(false)
                }
            }

            onPositionChanged: function(mouse) {
//                    model.x = mouse.x
//                    model.y = mouse.y
            }
        }
        function setRectDragEnable(enable) {
            console.log("setRectDragEnable(", enable, ")")
            _editableRect.rectDragEnable = enable
            if (enable) {
                _rectMouseArea.cursorShape = Qt.CrossCursor
            } else {
                _rectMouseArea.cursorShape = Qt.ArrowCursor
            }
        }
    }

}
