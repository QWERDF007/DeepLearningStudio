import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI
import "./Component"


Item {
    id: centerItem
    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: 5
        QuickTabBar {
            id: trainingTabBar
            implicitHeight: 40
            Layout.fillWidth: true
            spacing: 5
            highlight: null

            QuickTabButton {
                text: qsTr("设置")
                implicitHeight: parent.height
                antialiasing: true
                icon.width: 24
                icon.height: 24
                icon.source: "/icons/settings_tab"
            }

            QuickTabButton {
                text: qsTr("结果")
                implicitHeight: parent.height
                antialiasing: true
                icon.width: 24
                icon.height: 24
                icon.source: "/icons/results"
            }
        }

        StackLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: trainingTabBar.currentIndex
            Rectangle {
                id: settingTab
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "blue"
            }
            Rectangle {
                id: discoverTab
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "green"
            }
        }
    }
}
