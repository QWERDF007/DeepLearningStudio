import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import dl.studio.theme 1.0

ToolBar {
    id: control
    height: 48
    width: parent.width

    property int margin: 2
    property alias currentIndex: mainTabBar.currentIndex
    property alias currentItem: mainTabBar.currentItem

    background: Rectangle {
        color: Theme.primaryColor
    }

    RowLayout {

        anchors.fill: parent
//        width: control.width
//        height: control.height - control.margin
        ToolButton {
            id: toolBtn
            height: control.height
            Layout.alignment: Qt.AlignVCenter
            action: Action {
                icon.source: "/icons/menu"
                icon.height: control.height
                onTriggered: mainMenu.open()
            }
            MainMenu {
                id: mainMenu
                y: parent.height
            }
        }


        MainTabBar {
            id: mainTabBar
            Layout.alignment: Qt.AlignVCenter
            Layout.fillWidth: true
//            height: control.height
//            MainTabButton {text: "项目"; height:control.height; width: 80; anchors.centerIn: parent}
            Repeater {
                id: rep
                model: ["项目", "图库", "标注", "检查", "训练", "评估", "导出"]
                height: control.height
                MainTabButton {
                    id: tbtn
                    width: 100
                    height: control.height
                    anchors.verticalCenter: parent.verticalCenter
                    text: modelData
                    textColor: mainTabBar.currentIndex === index ? Theme.highlightColor : "white"
                    Component.onCompleted: {
                        console.log("MainTabButton height", tbtn.height, mainHeader.height)
                    }
                }

            }
            Component.onCompleted: {
                mainTabBar.height = control.height
                console.log("MainTabBar height", mainTabBar.height, mainHeader.height)
            }
        }

        Rectangle {
            width: 200
            height: control.height - control.margin
            Layout.alignment: Qt.AlignRight
            radius: 5
            color: "black"
            border.color: "#80ffffff"
            border.width: 1
            Component.onCompleted: {
                console.log("MainHeader Rectangle height", control.height)
            }
        }

        ToolSeparator {
            height: control.height
        }

        Rectangle {
            width: 200
            height: control.height - control.margin
            Layout.alignment: Qt.AlignRight
            radius: 5
            //                Layout.alignment: Qt.AlignRight
            color: "black"
            border.color: "#80ffffff"
            border.width: 1
            Component.onCompleted: {
                console.log("MainHeader Rectangle height", control.height)
            }
        }
    }
    Component.onCompleted: {
        console.log("MainHeader height", control.height)
    }
}
