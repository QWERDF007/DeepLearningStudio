import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI


Rectangle {
    id: imageInfoPanel
    width: 400
    height: 400
    color: QuickColor.Primary

    clip: true

    property int imageInfoFontSize: 12

    states: [
        State {
            name: "unexpand"
            when: !imageInfoExpander.expand
            PropertyChanges { target: imageInfoPanel; implicitHeight: imageInfoExpander.headerHeight + infoSummary.height + 5 }
            PropertyChanges { target: infoSummary; visible: true }
        }
    ]

    ScrollView {
        id: infoSummary
        visible: false
        anchors.top: imageInfoExpander.top
        anchors.topMargin: imageInfoExpander.headerHeight
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottomMargin: 5
        height: 48
        contentWidth: availableWidth
        property int scrollbarWidth: 8
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        ScrollBar.vertical.policy: infoSummary.contentHeight > infoSummary.height ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff
        ScrollBar.vertical.width: scrollbarWidth

        RowLayout {
            width: parent.width - infoSummary.scrollbarWidth - 2
            height: parent.height
            Label {
                text: "图像名称长一点的图像名称怎么看呢图像名称图像名称"
                font.pointSize: imageInfoFontSize
                Layout.alignment: Qt.AlignTop
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }
            Label {
                id: datasetLabel2
                text: qsTr("数据集123")
                font.pointSize: 10
                color: datasetLabel2.palette.buttonText
                Layout.alignment: Qt.AlignRight | Qt.AlignTop
                padding: 2
                background: Rectangle {
                    color: "#909090"
                    radius: 4
                }
            }
        }
    }

    Expander {
        id: imageInfoExpander
        duration: 0
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        headerText: "图像:"
        headerPixelSize: 16

        content: ScrollView {
            id: scrollview
            height: parent.height
            width: parent.width
            contentWidth: availableWidth

            property int scrollbarWidth: 8

            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical.policy: scrollview.contentHeight > scrollview.height ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff
            ScrollBar.vertical.width: scrollbarWidth
            ColumnLayout {
                id: container
                width: parent.width - scrollview.scrollbarWidth - 2
                height: childrenRect.height
                spacing: 10

                RowLayout {
                    Label {
                        text: qsTr("图像 1/10")
                        Layout.fillWidth: true
                        font.pointSize: imageInfoFontSize
                    }
                    Label {
                        id: datasetLabel
                        text: qsTr("数据集123")
                        font.pointSize: 10
                        color: datasetLabel.palette.buttonText
                        Layout.alignment: Qt.AlignRight
                        padding: 2
                        background: Rectangle {
                            color: "#909090"
                            radius: 4
                        }
                    }
                }

                ColumnLayout {
                    Label {
                        text: qsTr("名称:")
                        opacity: 0.5
                        font.pointSize: imageInfoFontSize
                    }
                    Label {
                        text: qsTr("图像名称")
                        font.pointSize: imageInfoFontSize
                    }
                }
                ColumnLayout {
                    Label {
                        text: qsTr("路径:")
                        font.pointSize: imageInfoFontSize
                        opacity: 0.5
                    }
                    Label {
                        text: qsTr("图像路径")
                        font.pointSize: imageInfoFontSize
                    }
                }
                ColumnLayout {
                    width: parent.width
                    Label {
                        text: qsTr("大小:")
                        font.pointSize: imageInfoFontSize
                        opacity: 0.5
                    }
                    Label {
                        text: qsTr("图像大小")
                        font.pointSize: imageInfoFontSize
                    }
                }
                ColumnLayout {
                    width: parent.width
                    Label {
                        text: qsTr("标签实例: (15)")
                        font.pointSize: imageInfoFontSize
                        opacity: 0.5
                    }
                    Label {

                        text: qsTr("标签1(10), 标签2(5), 标签3(10), 标签2(5)标签2(5)标签2(5)标签2(5)标签2(5)标签2(5)标签2(5)")
                        wrapMode: Text.WordWrap
                        font.pointSize: imageInfoFontSize
                        Layout.fillWidth: true
                    }
                }
                // spacer
                Item {
                    Layout.fillHeight: true
                }
                Component.onCompleted: {
                    console.log("layout height", container.height, scrollview.height, childrenRect.height)
                }
            }
            Component.onCompleted: {
                console.log("scroll view height", container.height, scrollview.height, childrenRect.height)
            }
        }
    }
}
