import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import dl.studio.theme 1.0

import QuickUI

import "./Component"

Item {
    id: mainHeader
    implicitHeight: 48
    width: parent.width

    property int margin: 2
    property alias currentIndex: mainTabBar.currentIndex
    property alias currentItem: mainTabBar.currentItem

    //    background: Rectangle {
    //        color: Theme.primary
    //    }
    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 0
        RowLayout {
            width: parent.width
            height: parent.height / 2
            Layout.topMargin: 0
            Layout.alignment: Qt.AlignTop

            ToolBar {
                height: parent.height
                Layout.topMargin: 0
                Layout.fillWidth: true
                RowLayout {
                    anchors.fill: parent
                    Layout.topMargin: 0
                    QuickToolButton {
                        id: toolBtn
                        Layout.alignment: Qt.AlignVCenter
                        icon.source: "/icons/menu"
                        icon.height: 36
                        icon.width: 28
                        onClicked: mainMenu.isOpened ? mainMenu.close() : mainMenu.open()
                        backgroundColor: Theme.primary
                        MainMenu {
                            id: mainMenu
                            y: parent.height
                        }
                    }

                    MainTabBar {
                        id: mainTabBar
                        height: parent.height
                        Keys.onPressed: (event)=> {
                                            console.log(event.key)
                                        }

                        Layout.alignment: Qt.AlignVCenter
                        Layout.fillWidth: true
                        Repeater {
                            id: rep
                            model: ["项目", "图库", "标注", "检查", "训练", "评估", "导出"]
                            height: parent.height
                            MainTabButton {
                                id: tbtn
                                width: 100
                                implicitHeight: parent.height
                                anchors.verticalCenter: parent.verticalCenter
                                text: modelData
                                textColor: mainTabBar.currentIndex === index ? Theme.highlight : "white"
                                focusPolicy: Qt.NoFocus
                            }
                        }
                    }
                    ToolBar {
                        height: parent.height
                        Layout.alignment: Qt.AlignRight
                        RowLayout {
                            Layout.leftMargin: 5
                            Layout.rightMargin: 5
                            height: parent.height
                            QuickToolButton {
                                icon.source: "/icons/bar_chart"
                                implicitWidth: 32
                                implicitHeight: 32
                                icon.width: 32
                                icon.height: 32
                                Layout.leftMargin: 5
                                Layout.alignment: Qt.AlignHCenter
                                backgroundVisible: hovered ? true : false
                            }
                            QuickToolButton {
                                id: filterBtn
                                checkable: true
                                icon.source: "/icons/filter_show"
                                implicitWidth: 32
                                implicitHeight: 32
                                icon.width: 32
                                icon.height: 32
                                Layout.rightMargin: 5
                                Layout.alignment: Qt.AlignHCenter
                                backgroundVisible: hovered ? true : false
                            }
                        }
                    }
                }
            }

            ToolBar {
                height: parent.height
                RowLayout {
                    height: parent.height
                    QuickToolButton {
                        icon.source: "/icons/help_menu"
                        implicitWidth: 32
                        implicitHeight: 32
                        icon.width: 32
                        icon.height: 32
                        Layout.leftMargin: 5
                        Layout.alignment: Qt.AlignHCenter
                        backgroundVisible: hovered ? true : false
                    }

                    QuickToolButton {
                        icon.source: "/icons/setting"
                        implicitWidth: 32
                        implicitHeight: 32
                        icon.width: 32
                        icon.height: 32
                        Layout.rightMargin: 5
                        Layout.alignment: Qt.AlignHCenter
                        backgroundVisible: hovered ? true : false
                    }
                }
            }
        }
        RowLayout {
            //            Layout.alignment: Qt.AlignTop
            id: filterBar
            visible: false
            width: parent.width
            height: parent.height / 2
            ToolBar {
                height: parent.height
                RowLayout {
                    clip: true
                    height: parent.height
                    QuickToolButton {
                        icon.source: "/icons/filter_add"
                        implicitWidth: 32
                        implicitHeight: 32
                        icon.width: 32
                        icon.height: 32
                        Layout.leftMargin: 5
                        Layout.alignment: Qt.AlignHCenter
                        backgroundVisible: hovered ? true : false
                    }

                    DropDownMenuButton {
                        implicitHeight: 32
                        radius: 4
                        text: qsTr("按标签: 已标注")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter
                        popupContentItem: ListView {
                            spacing: 3
                            implicitWidth: contentItem.childrenRect.width
                            implicitHeight: contentItem.childrenRect.height
                            model: testModel1
                            delegate: CheckBox {
                                width: 200
                                height: 32
                                text: model.text
                                palette {
                                    mid: model.color
                                    text: "green"
                                }
                            }

//                            delegate: QuickCheckBox {
//                                width: 200
//                                height: 28
//                                text: model.text
//                                checked: model.checked
//                                indicatorItem.color: model.color
//                                indicatorItem.border.color: "black"
//                            }
                        }
                    }

                    ListModel {
                        id: testModel1
                        ListElement { text: "数据集1"; color: "red"; checked: true }
                        ListElement { text: "数据集2"; color: "green"; checked: false }
                        ListElement { text: "数据集3"; color: "blue"; checked: true }
                        ListElement { text: "数据集4"; color: "yellow"; checked: true }
                        ListElement { text: "数据集5"; color: "lightgreen"; checked: false }
                        ListElement { text: "数据集6"; color: "yellow"; checked: true }
                    }

                    DropDownMenuButton {
                        implicitHeight: 32
                        radius: 4
                        text: qsTr("按数据集: 数据集1")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter
                        popupContentItem: ListView {
                            spacing: 5
                            implicitWidth: contentItem.childrenRect.width
                            implicitHeight: contentItem.childrenRect.height
                            model: testModel1
                            delegate: QuickCheckBox {
                                x: 0
                                width: 200
                                height: 20
                                padding: 0
                                text: model.text
                                font.pixelSize: 16
                                checked: model.checked
                                indicatorItem.color: model.color
                                indicatorItem.border.color: "black"
                            }
                        }
                    }

                    SearchBar {
                        Layout.alignment: Qt.AlignHCenter
                        Layout.rightMargin: 5
                    }
                }
            }
            ToolBar {
                height: parent.height
                Layout.fillWidth: true
            }
            ToolBar {
                height: parent.height
                RowLayout {
                    height: parent.height
                    Label {
                        text: "已筛选的图像100/200"
                        Layout.alignment: Qt.AlignHCenter
                        Layout.rightMargin: 5
                        Layout.leftMargin: 5
                    }
                }
            }
        }
    }

    states: State {
        name: "checked"
        when: filterBtn.checked
        PropertyChanges { filterBtn.icon.source: "/icons/filter_hide"; filterBtn.icon.color: Theme.highlight }
        PropertyChanges { mainHeader.implicitHeight: 96 }
        PropertyChanges { filterBar.visible: true }
    }
}
