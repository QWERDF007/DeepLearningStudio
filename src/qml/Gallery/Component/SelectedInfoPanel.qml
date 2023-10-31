import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

Rectangle {
    id: control
    width: 400
    height: 400
    color: QuickColor.Primary
    property int iconSize: 14
    property int selected: 1
    property int total: 20
    clip: true

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 5
        spacing: 5
        RowLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            Label {
                text: qsTr("已选择:")
                Layout.fillWidth: true
                font.pixelSize: 16
            }
            QuickToolButton {
                backgroundVisible: true
                ToolTip.visible: hovered
                ToolTip.delay: 500
                ToolTip.text: qsTr("清除选择 (Esc)")
                icon.source: "/icons/close"
                icon.height: 28
                icon.width: 28
                Layout.alignment: Qt.AlignRight
            }
        }
        RowLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignBottom
            Label {
                id: selectedImageLabel
                text: control.selected + "/" + control.total + qsTr("个图像")
                Layout.fillWidth: true
            }

            QuickToolButton {
                icon.source: "/icons/delete"
                icon.height: 28
                icon.width: 28
                backgroundVisible: true
                ToolTip.visible: hovered
                ToolTip.delay: 500
                ToolTip.text: qsTr("从项目中移除所选图像 (Del)")
                Layout.alignment: Qt.AlignRight
            }
        }
    }
}
