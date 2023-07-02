import QtQuick
import QtQuick.Controls
import dl.studio.theme 1.0

ToolButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    padding: 6
    spacing: 6

    icon.width: 24
    icon.height: 24
    icon.color: visualFocus ? control.palette.highlight : control.palette.brightText

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: control.visualFocus ? control.palette.highlight : control.palette.brightText
    }

    background: Rectangle {
        id: bg
        implicitWidth: 40
        implicitHeight: 40

        opacity: control.down ? 1.0 : 0.5
        color: control.down || control.checked || control.highlighted ? control.palette.mid : Theme.primary
    }

    states: State {
        name: "hoverd"
        when: control.hovered
        PropertyChanges {
            bg.color: Qt.lighter(Theme.primary, 1.3)

        }
    }
}
