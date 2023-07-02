import QtQuick
import QtQuick.Controls
import dl.studio.theme 1.0

TabButton {
    id: control
    property alias textColor: content.color
    contentItem: IconLabel {
        id: content
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: control.palette.brightText
    }

    background: Rectangle {
        id: bg
        implicitWidth: 100
        implicitHeight: control.height
        opacity: enabled ? 1 : 0.3
        color: control.down ? Theme.tabButton.down : Theme.primary
        radius: 2
    }

    states: State {
        name: "hoverd"
        when: control.hovered
        PropertyChanges { bg.color: Theme.tabButton.down }
    }
}
