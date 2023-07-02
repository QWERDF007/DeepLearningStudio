import QtQuick
import QtQuick.Controls

import dl.studio.theme 1.0

TabButton {
    id: control

    icon.width: 24
    icon.height: 24
    icon.color: control.palette.brightText

    contentItem: IconLabel {
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

        color: control.hovered ? Qt.lighter(control.checked ? Theme.tabButton.highlight:  control.down ? Theme.tabButton.down : Theme.tabButton.primary, 1.1) :
                                 control.checked ? Theme.tabButton.highlight:  control.down ? Theme.tabButton.down : Theme.tabButton.primary
        radius: 2
    }
}
