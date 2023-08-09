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
        color: Theme.primary
    }

    RowLayout {

        anchors.fill: parent
        ToolButton {
            id: toolBtn
            height: control.height
            Layout.alignment: Qt.AlignVCenter
            icon.source: "/icons/menu"
            onClicked: mainMenu.isOpened ? mainMenu.close() : mainMenu.open()

            MainMenu {
                id: mainMenu
                y: parent.height
            }
        }


        MainTabBar {
            id: mainTabBar
            Keys.onPressed: (event)=> {
                console.log(event.key)
            }

            Layout.alignment: Qt.AlignVCenter
            Layout.fillWidth: true
            Repeater {
                id: rep
                model: ["项目", "图库", "标注", "检查", "训练", "评估", "导出"]
                height: control.height
                MainTabButton {
                    id: tbtn
                    width: 100
                    implicitHeight: control.height
                    anchors.verticalCenter: parent.verticalCenter
                    text: modelData
                    textColor: mainTabBar.currentIndex === index ? Theme.highlight : "white"
                    focusPolicy: Qt.NoFocus
                }
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

        }

        ToolSeparator {
            height: control.height
        }

        Rectangle {
            width: 200
            height: control.height - control.margin
            Layout.alignment: Qt.AlignRight
            radius: 5
            color: "black"
            border.color: "#80ffffff"
            border.width: 1
        }
    }
}
