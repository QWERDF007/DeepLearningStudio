import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

Rectangle {
    width: 200
    height: 200
    color: QuickColor.Primary

    RowLayout {
        anchors.top: imageInfoExpander.top
        anchors.right: imageInfoExpander.right
        anchors.topMargin: 3
        anchors.rightMargin: 8
        QuickToolButton {
            padding: 4
            backgroundVisible: hovered
            ToolTip.visible: hovered
            ToolTip.delay: 500
            ToolTip.text: qsTr("添加图片")
            icon.source: "/icons/add_image"
            icon.height: 24
            icon.width: 24

            onClicked: {
                console.log("添加图片")
            }
        }

        QuickToolButton {
            padding: 4
            backgroundVisible: hovered
            ToolTip.visible: hovered
            ToolTip.delay: 500
            ToolTip.text: qsTr("添加数据集")
            icon.source: "/icons/add"
            icon.height: 24
            icon.width: 24

            onClicked: {
                console.log("添加数据集")
                var labeled = getRandomInt(4999)
                var total  = labeled + getRandomInt(4999)
                imageInfoListModel.append({text: new Date().toLocaleDateString(), labeled: labeled, total: total})
            }
        }
    }

    function getRandomInt(max) {
      return Math.floor(Math.random() * max);
    }


    Expander {
        id: imageInfoExpander
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        headerText: "数据集:"
        headerHeight: 36
        headerPixelSize: 16

        content: ListView {
            id: datasetListView
            clip: true
            height: parent.height
            width: parent.width
            spacing: 3

            ScrollBar.vertical: ScrollBar {
                id: scrollbar
                policy: datasetListView.contentHeight > datasetListView.height ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff
                width: 8
            }

            //            highlight: null
            highlightFollowsCurrentItem: false

            model: ListModel {
                id: imageInfoListModel
                ListElement { text: "数据集070112312312"; labeled: 10; total: 20 }
                ListElement { text: "数据集0801412312"; labeled: 0; total: 20 }
                ListElement { text: "数据集07304412121"; labeled: 10; total: 20 }
                ListElement { text: "数据集071234"; labeled: 20; total: 20 }
                ListElement { text: "数据集0656124"; labeled: 10; total: 30 }
                ListElement { text: "数据集012567"; labeled: 10; total: 20 }
                ListElement { text: "数据集0729123123"; labeled: 10; total: 2000 }
                ListElement { text: "数据集072912312321"; labeled: 10; total: 50 }
                ListElement { text: "数据集072967568678"; labeled: 10; total: 20 }
                ListElement { text: "数据集07291dsfgfa"; labeled: 555; total: 9999 }
                ListElement { text: "数据集0729gfdgfd"; labeled: 14; total: 28 }
                ListElement { text: "数据集072911qqq"; labeled: 16; total: 29 }
                ListElement { text: "数据集0729ffsadr"; labeled: 24; total: 24 }
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
                    anchors.rightMargin: 5
                    spacing: 3

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
                    }

                    QuickProgressBar {
                        id: pb
                        implicitWidth: 50
                        implicitHeight: 10
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
                        icon.source: "/icons/kebab"
                        icon.color: Qt.lighter(editBtn.palette.brightText, editBtn.hovered ? 1.0 : 0.7)
                        icon.height: 16
                        icon.width: 16
                        padding: 0
                        backgroundVisible: false
                        ToolTip {
                            id: editBtnTip
                            visible: editBtn.hovered
                            delay: 500
                            text: qsTr("显示进一步的行动")
                        }

                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        onClicked: {
                            console.log("编辑", model.text)
                        }
                    }
                }
            }
        }
    }
}
