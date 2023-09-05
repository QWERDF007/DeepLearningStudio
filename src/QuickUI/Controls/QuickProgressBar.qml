import QtQuick
import QtQuick.Controls

import QuickUI

ProgressBar {
    id: control
    value: 0.5
    padding: 2

    implicitWidth: 100
    implicitHeight: 20

    property alias backgroundRect: _background
    property alias percentage: percentageLabel

    background: Rectangle {
        id: _background
        implicitWidth: control.implicitWidth
        implicitHeight: control.implicitHeight

//        anchors.fill: parent

        color: QuickColor.BackGround
        radius: 0
    }

    contentItem: Item {
//        anchors.fill: parent
        implicitWidth: control.implicitWidth
        implicitHeight: control.implicitHeight

        Rectangle {
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
