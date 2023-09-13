import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

Rectangle {
    id: mainHeader
    height: 28
    width: parent.width
    color: QuickColor.Primary

    RowLayout {
        anchors.fill: parent
        anchors.topMargin: 0

        RowLayout {
            Layout.fillHeight: true
            Layout.topMargin: 0
            Layout.rightMargin: 48
            Layout.alignment: Qt.AlignRight
            Label {
                Layout.alignment: Qt.AlignVCenter
                text: "已标注的图像: "
                font.pixelSize: 16
            }
            QuickProgressBar {
                Layout.alignment: Qt.AlignVCenter
            }
        }
    }
}
