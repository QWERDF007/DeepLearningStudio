import QtQuick
import QtQuick.Controls


import QuickUI

Switch {
    id: control
    text: qsTr("")
    implicitWidth: 48
    implicitHeight: 26
    property int radius: Math.min(implicitHeight, implicitWidth)

    property alias indicatorItem: _indicator
    property alias circleItem: circle
    property alias textItem: _content
    property int duration: 200

    indicator: Rectangle {
        id: _indicator
        implicitWidth: control.implicitWidth
        implicitHeight: control.implicitHeight
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: control.radius
        color: control.checked ? QuickColor.HighLight : "#ffffff"
        border.color: control.checked ? QuickColor.HighLight : "#cccccc"

        // 中间圆形
        Rectangle {
            id: circle
            anchors.verticalCenter: parent.verticalCenter
            x: control.checked ? parent.width - width: 0
            width: Math.min(parent.width, parent.height)
            height: Math.min(parent.width, parent.height)
            radius: circle.height / 2
            color: control.checked ? "white" : QuickColor.BrightButton
            scale: hovered & enabled ? 8/10 : 7/10

            Behavior on x  {
                NumberAnimation {
                    duration: control.duration
                    easing.type: Easing.OutCubic
                }
            }

            Behavior on scale {
                NumberAnimation {
                    duration: control.duration
                    easing.type: Easing.OutCubic
                }
            }
        }
    }

    contentItem: Text {
        id: _content
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
//        color: control.down ? "#17a81a" : "#21be2b"
        color: control.palette.brightText
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
