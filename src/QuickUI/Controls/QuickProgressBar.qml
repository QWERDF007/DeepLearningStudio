import QtQuick
import QtQuick.Controls

import QuickUI

ProgressBar {
    id: control
    value: 0.5
    padding: 1

    implicitWidth: 100
    implicitHeight: 20

    property alias backgroundRect: _background
    property alias percentage: percentageLabel

    background: Rectangle {
        id: _background
//        anchors.fill: parent
        implicitWidth: control.implicitWidth
        implicitHeight: control.implicitHeight
        color: QuickColor.BackGround
        radius: 0
    }

    contentItem: Item {
//        anchors.fill: parent
        implicitWidth: control.implicitWidth
        implicitHeight: control.implicitHeight

        Rectangle {
//            anchors.top: parent.top
//            anchors.bottom: parent.bottom
            width: control.visualPosition * parent.width
            height: parent.height
            radius: 0
            color: QuickColor.HighLight
        }

        Label {
            id: percentageLabel
            anchors.centerIn: parent
            height: Math.min(control.implicitHeight - 6, 24)
            text: (control.value / control.to * 100).toFixed(0) + "%"
            horizontalAlignment: Text.AlignHCenter
            fontSizeMode: Text.Fit
        }
    }
}
