import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: _labellingCenter
    width: 400
    height: 600
    clip: true
    Image {
        id: image
//        anchors.fill: parent
        width: parent.width
        height: parent.height
        source: "file:///D:/Datasets/Photos/raw/F3f6LKvW4AAgnDi.jpg"
        sourceSize.width: Math.min(parent.width, parent.height)
        sourceSize.height: Math.min(parent.width, parent.height)
        fillMode: Image.PreserveAspectFit
    }

//    DragHandler {
//        acceptedButtons: Qt.MiddleButton
//        target: image
//        snapMode: DragHandler.SnapNever
//    }

    property bool imageDragEnable: false

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
                }
            } else if (mouse.button === Qt.MiddleButton) {
                setImageDragEnable(true)
            } else if (mouse.button === Qt.RightButton) {

            }
        }

        onReleased: function (mouse) {
            if (_labellingCenter.imageDragEnable) {
                setImageDragEnable(false)
            }
        }
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
}
