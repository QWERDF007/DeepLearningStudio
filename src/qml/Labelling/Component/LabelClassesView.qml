import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

ListView {
    id: labelClassesListView
    clip: true
    width: 400
    height: 600
    spacing: 3

    ScrollBar.vertical: ScrollBar {
        id: scrollbar
        policy: labelClassesListView.contentHeight > labelClassesListView.height ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff
        width: 8
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
            spacing: 3

            Rectangle {
                width: 24
                height: 24
                radius: 3
                Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                color: model.color
                border.color: "black"
                border.width: 1
                Label {
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: model.shortcut
                    font.pixelSize: 16
                    color: palette.buttonText
                }
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
                Layout.rightMargin: 15
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
            anchors.rightMargin: 2
            onClicked: {
                console.log("删除标签", model.text)
            }
        }
    }
}
