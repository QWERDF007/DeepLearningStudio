import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material.impl

import QuickUI

TabButton {
    id: control

    padding: 4
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
        color: control.icon.color
    }



    background: Rectangle {
        id: bg
        width: control.width
        height: control.height
        opacity: enabled ? 1 : 0.3
        clip: true

        color: Qt.lighter(control.checked ? QuickColor.HighLight : control.down ? QuickColor.BrightButton : QuickColor.DarkButton, control.hovered ? 1.1 : 1.0)
        radius: 3

        // 波纹效果
        Ripple {
            clipRadius: 1
            width: parent.width
            height: parent.height
            pressed: control.pressed
            anchor: control
            active: control.down
            color: control.flat && control.highlighted ?  control.Material.highlightedRippleColor : control.Material.rippleColor
        }
    }
}
