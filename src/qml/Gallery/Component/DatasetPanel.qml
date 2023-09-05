import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import dl.studio.theme 1.0

import QuickUI

Rectangle {
    width: 200
    height: 200
    color: Theme.primary

    Expander {
        id: imageInfoExpander
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        headerText: "数据集:"
        headerFont.pointSize: 12

        content: ListView {
            id: datasetListView
            clip: true
            height: parent.height
            width: parent.width
//            contentWidth: availableWidth
            spacing: 3

            ScrollBar.vertical: ScrollBar {
                id: scrollbar
                policy: datasetListView.contentHeight > datasetListView.height ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff
                width: 8
            }

            //            highlight: null
            highlightFollowsCurrentItem: false

            model: ListModel {
                ListElement { text: "数据集070112312312"; labeled: 10; total: 20 }
                ListElement { text: "数据集0801412312"; labeled: 0; total: 20 }
                ListElement { text: "数据集07304412121"; labeled: 10; total: 20 }
                ListElement { text: "数据集071234"; labeled: 11; total: 20 }
                ListElement { text: "数据集0656124"; labeled: 10; total: 30 }
                ListElement { text: "数据集012567"; labeled: 10; total: 20 }
                ListElement { text: "数据集0729123123"; labeled: 10; total: 2000 }
                ListElement { text: "数据集072912312321"; labeled: 10; total: 50 }
                ListElement { text: "数据集072967568678"; labeled: 10; total: 20 }
                ListElement { text: "数据集07291dsfgfa"; labeled: 12; total: 9999 }
                ListElement { text: "数据集0729gfdgfd"; labeled: 14; total: 28 }
                ListElement { text: "数据集072911qqq"; labeled: 16; total: 29 }
                ListElement { text: "数据集0729ffsadr"; labeled: 10; total: 24 }
                ListElement { text: "数据集0729hhgfjfjf"; labeled: 10; total: 25 }
            }
            delegate: Rectangle {
                id: datasetItem
                radius: 4
                //                clip: true
                //            anchors.fill: parent
                width: parent != null ? parent.width - scrollbar.width - 2 : 40
                height: 24

                property color edgeColor: Qt.lighter("#585858", hoverHandler.hovered ? 1.2 : 1.0)
                property color centerColor: Qt.lighter("#4E4E4E", hoverHandler.hovered ? 1.2 : 1.0)

                gradient: Gradient {
                    GradientStop { position: 0.0; color: edgeColor }
                    GradientStop { position: 0.35; color: centerColor }
                    GradientStop { position: 0.9; color: centerColor }
                    GradientStop { position: 1.0; color: edgeColor }
                }

                HoverHandler { id: hoverHandler}


                RowLayout {
                    id: row
                    anchors.fill: parent
                    anchors.leftMargin: 5
                    anchors.rightMargin: 10
                    spacing: 3
                    QuickToolButton {
                        id: visibleBtn
                        checkable: true
                        icon.source: "/icons/visible"
                        icon.color: Qt.lighter(visibleBtn.palette.brightText, visibleBtn.hovered ? 1.0 : 0.7)
                        icon.height: 12
                        icon.width: 12
                        padding: 0
                        backgroundVisible: false
                        ToolTip {
                            id: visibleBtnTip
                            visible: visibleBtn.hovered
                            delay: 500
                            text: qsTr("隐藏数据集")
                        }

                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        states: State {
                            name: "checked"
                            when: visibleBtn.checked
                            PropertyChanges { visibleBtn.icon.source: "/icons/invisible"; visibleBtnTip.text: qsTr("显示数据集") }
                        }
                        onClicked: {
                            console.log(visibleBtn.checked ? "隐藏" : "显示", model.text)
                        }
                    }

                    Label {
                        id: datasetNameLabel
                        clip: true
                        text: model.text
                        font.pointSize: 12
                        elide: Text.ElideRight
                        Layout.alignment: Qt.AlignVCenter
                        Layout.fillWidth: true
                        ToolTip {
                            visible: /*datasetNameLabel.contentWidth > datasetNameLabel.width &&*/ datasetNameMouseArea.containsMouse
                            delay: 500
                            text: model.text
                        }
                        MouseArea {
                            id: datasetNameMouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                        }
                        Component.onCompleted: {
                            console.log("text", model.text, datasetNameLabel.contentWidth, datasetNameLabel.implicitWidth, datasetNameLabel.contentWidth > datasetNameLabel.width)
                        }
                    }

//                    ProgressBar {
//                        implicitWidth: 60
//                        from: 0
//                        to: model.total
//                        value: model.labeled
//                        Layout.alignment: Qt.AlignHCenter | Qt.AlignRight
//                        //                        Layout.fillHeight: true
//                    }

                    QuickProgressBar {
                        id: pb
                        implicitWidth: 60
                        implicitHeight: 12
                        from: 0
                        to: model.total
                        value: model.labeled
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignRight
                        percentage.visible: false
                        ToolTip {
                            visible: pb.hovered
                            delay: 500
                            text: pb.value + " / " + pb.to + " ("  + (pb.value / pb.to * 100).toFixed(0) + "%)"
                        }
                    }

                    QuickToolButton {
                        id: editBtn
                        icon.source: "/icons/edit"
                        icon.color: Qt.lighter(editBtn.palette.brightText, editBtn.hovered ? 1.0 : 0.7)
                        icon.height: 12
                        icon.width: 12
                        padding: 0
                        backgroundVisible: false
                        ToolTip {
                            id: editBtnTip
                            visible: editBtn.hovered
                            delay: 500
                            text: qsTr("编辑数据集")
                        }

                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        onClicked: {
                            console.log("编辑", model.text)
                        }
                    }
                }

                QuickToolButton {
                    id: deleteBtn
                    icon.source: "/icons/delete"
                    icon.color: Qt.lighter(visibleBtn.palette.brightText, deleteBtn.hovered ? 1.0 : 0.7)
                    icon.height: 10
                    icon.width: 9
                    padding: 0
                    backgroundVisible: false
                    ToolTip {
                        id: deleteBtnTip
                        visible: deleteBtn.hovered
                        delay: 500
                        text: qsTr("删除数据集")
                    }
                    anchors.horizontalCenter: datasetItem.right
                    anchors.horizontalCenterOffset: -3
                    anchors.verticalCenter: datasetItem.top
                    anchors.verticalCenterOffset: 5

                    onClicked: {
                        console.log("删除数据集", model.text)
                    }
                }
            }
        }
    }
}
