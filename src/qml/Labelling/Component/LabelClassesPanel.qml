import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

Rectangle {
    width: 200
    height: 200
    color: QuickColor.Primary

    Expander {
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        headerText: "标签类别:"
        headerFont.pointSize: 12

        content: ListView {
            id: labelClassesListView
            clip: true
            height: parent.height
            width: parent.width
            spacing: 3

            ScrollBar.vertical: ScrollBar {
                id: scrollbar
                policy: labelClassesListView.contentHeight > labelClassesListView.height ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff
                width: 8
            }

            model: ListModel {
                ListElement { text: "背景"; color: "gray"; shortcut: "0" }
                ListElement { text: "标签1"; color: "yellow"; shortcut: "1" }
                ListElement { text: "标签3"; color: "green"; shortcut: "2" }
                ListElement { text: "标签4"; color: "blue"; shortcut: "3" }
                ListElement { text: "标签5"; color: "red"; shortcut: "4" }
                ListElement { text: "标签6"; color: "lightgreen"; shortcut: "" }
                ListElement { text: "标签7"; color: "lightblue"; shortcut: "6" }
                ListElement { text: "标签8"; color: "pink"; shortcut: "" }
                ListElement { text: "标签9"; color: "lightgray"; shortcut: "8" }
            }

            delegate: Rectangle {
                id: datasetItem
                radius: 4
                width: parent != null ? parent.width - scrollbar.width - 2 : 40
                height: 24

                HoverHandler { id: hoverHandler}

                property color edgeColor: Qt.lighter("#585858", hoverHandler.hovered ? 1.2 : 1.0)
                property color centerColor: Qt.lighter("#4E4E4E", hoverHandler.hovered ? 1.2 : 1.0)

                gradient: Gradient {
                    GradientStop { position: 0.0; color: edgeColor }
                    GradientStop { position: 0.35; color: centerColor }
                    GradientStop { position: 0.9; color: centerColor }
                    GradientStop { position: 1.0; color: edgeColor }
                }
                RowLayout {
                    id: row
                    anchors.fill: parent
                    anchors.leftMargin: 0
                    anchors.rightMargin: 5
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                    spacing: 3

                    Rectangle {
                        width: 24
                        height: 24
                        radius: 3
                        Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                        color: model.color
                        border.color: "black"
                        border.width: 1
                    }

                    Label {
                        text: model.text
                        font.pixelSize: 16
                        Layout.fillWidth: true
                    }
                    QuickToolButton {
                        id: editBtn
                        icon.source: "/icons/edit"
                        icon.color: Qt.lighter(editBtn.palette.brightText, editBtn.hovered ? 1.0 : 0.7)
                        icon.height: 16
                        icon.width: 16
                        padding: 0
                        backgroundVisible: false
                        ToolTip {
                            id: editBtnTip
                            visible: editBtn.hovered
                            delay: 500
                            text: qsTr("编辑标签")
                        }

                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        Layout.rightMargin: 10
                        onClicked: {
                            console.log("编辑标签", model.text)
                        }
                    }
                }
                QuickToolButton {
                    id: deleteBtn
                    icon.source: "/icons/delete"
                    icon.color: Qt.lighter(deleteBtn.palette.brightText, deleteBtn.hovered ? 1.0 : 0.7)
                    icon.height: 12
                    icon.width: 12
                    padding: 0
                    backgroundVisible: false
                    ToolTip {
                        id: deleteBtnTip
                        visible: deleteBtn.hovered
                        delay: 500
                        text: qsTr("删除标签")
                    }

                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.topMargin: 0
                    anchors.rightMargin: 2
                    onClicked: {
                        console.log("删除标签", model.text)
                    }
                }
            }
        }
    }
}
