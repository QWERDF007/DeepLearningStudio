import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material.impl

//import dl.studio.theme 1.0

import QuickUI


ToolButton {
    id: control
    property color backgroundColor: QuickColor.BackGround
    property int radius: 2
    property bool backgroundVisible: true

    implicitWidth: Math.max(implicitBackgroundWidth, implicitContentWidth)
    implicitHeight: Math.max(implicitBackgroundHeight, implicitContentHeight)

    icon.color: control.palette.brightText
    spacing: 6

    contentItem: IconLabel {
        id: content

        mirrored: control.mirrored
        display: control.display
        spacing: control.spacing

        icon: control.icon
        text: control.text
        font: control.font
        color: control.palette.brightText

        opacity: enabled ? 1.0 : 0.3
    }

    background: Rectangle {
        implicitWidth: content.width
        implicitHeight: content.height
        radius: control.radius
        clip: true
        color: Qt.lighter(control.backgroundColor, control.hovered ? 1.2 : 1.0)
        opacity: enabled ? 1 : 0.3
        visible: control.backgroundVisible || control.hovered

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
