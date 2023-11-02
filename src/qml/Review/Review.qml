import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

Rectangle {
    width: 400
    height: 400
    anchors.fill: parent
    color: QuickColor.BackGround
    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 0
        SplitView {
            orientation: Qt.Horizontal
            Layout.fillWidth: true
            Layout.fillHeight: true

            ReviewLeftPanel {
                SplitView.minimumWidth: 160
                SplitView.maximumWidth: 600
                implicitWidth: 240
            }

            ReviewCenterPanel {
                SplitView.fillWidth: true
            }
        }
        ToolBar {
            width: 36
            Layout.fillHeight: true
            ColumnLayout {
                QuickToolButton {
                    icon.source: "/icons/size_plus"
                    implicitWidth: 32
                    implicitHeight: 32
                    icon.width: 32
                    icon.height: 32
                    Layout.topMargin: 5
                    Layout.alignment: Qt.AlignHCenter
                    backgroundVisible: hovered ? true : false
                }
                QuickToolButton {
                    icon.source: "/icons/aspect_plus"
                    implicitWidth: 32
                    implicitHeight: 32
                    icon.width: 32
                    icon.height: 32
                    Layout.topMargin: 5
                    Layout.alignment: Qt.AlignHCenter
                    backgroundVisible: hovered ? true : false
                }
                QuickToolButton {
                    icon.source: "/icons/brightness"
                    implicitWidth: 32
                    implicitHeight: 32
                    icon.width: 32
                    icon.height: 32
                    Layout.topMargin: 5
                    Layout.alignment: Qt.AlignHCenter
                    backgroundVisible: hovered ? true : false
                }
                QuickToolButton {
                    icon.source: "/icons/contrast"
                    implicitWidth: 32
                    implicitHeight: 32
                    icon.width: 32
                    icon.height: 32
                    Layout.topMargin: 5
                    Layout.alignment: Qt.AlignHCenter
                    backgroundVisible: hovered ? true : false
                }
            }
        }
    }
}
