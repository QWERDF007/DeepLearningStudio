import QtQuick
import QtQuick.Controls

TabButton {
    id: control
    property alias textColor: btnText.color
    text: "TabButton"
    contentItem: Text {
        id: btnText
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        Component.onCompleted: {
            console.log("text height", control.height)
        }
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: control.height
        opacity: enabled ? 1 : 0.3
        color: control.down ? "#6A6A6A" : "#3D3D3D"
        radius: 2
        Component.onCompleted: {
            console.log("Rectangle height", control.height)
        }
    }
    Component.onCompleted: {
        console.log("btn height", control.height)
    }
}
