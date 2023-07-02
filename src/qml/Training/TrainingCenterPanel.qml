import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import dl.studio.theme 1.0

Item {
    id: centerItem
    //    color: Theme.primary
    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: 5
        TrainingTabBar {
            id: bar
            height: 80
            Layout.fillWidth: true
            spacing: 5

            TrainingTabButton {
                text: qsTr("设置")
                implicitHeight: 40
                antialiasing: true
                icon.source: "/icons/settings_tab"
            }

            TrainingTabButton {
                text: qsTr("结果")
                implicitHeight: 40
                antialiasing: true
                icon.source: "/icons/results"
            }
        }
//        RowLayout {
//            Layout.fillWidth: true
//            height: 40
//            spacing: 5
//            Button {
//                text: qsTr("设置")
//                Layout.fillWidth: true
//                Material.roundedScale: Material.ExtraSmallScale
//            }
//            Button {
//                Layout.fillWidth: true
//                text: qsTr("结果")
////                width: parent.width * 0.5
//                Material.roundedScale: Material.ExtraSmallScale
//            }
//        }

        StackLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: bar.currentIndex
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
