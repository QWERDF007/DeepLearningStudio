import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

Rectangle {
    id: gallery
    width: 400
    height: 400
    anchors.fill: parent
    color: QuickColor.BackGround

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 0
        SplitView {
            //        anchors.fill: parent
            Layout.fillWidth: true
            Layout.fillHeight: true

            //            height: parent.height
            //        anchors.margins: 10
            orientation: Qt.Horizontal

            GalleryLeftPanel {
                id: galleryLeftPanel
                SplitView.minimumWidth: 160
                SplitView.maximumWidth: 600
                implicitWidth: 240

                // 图像大小信息绑定
                sizeScaleFrom: galleryCenterPanel.cellScaleFrom
                sizeScaleTo: galleryCenterPanel.cellScaleTo
                sizeScaleValue: galleryCenterPanel.cellScaleValue
                sizeScaleStepSize: galleryCenterPanel.cellScaleStepSize
                onSizeScaleValueChanged: {
                    galleryCenterPanel.cellScaleValue = sizeScaleValue
                }
            }

            GalleryCenterPanel {
                id: galleryCenterPanel
                SplitView.fillWidth: true
            }
        }

        ColumnLayout {
            implicitWidth: 36
            spacing: 3
            ToolBar {
                width: parent.width
                QuickToolButton {
                    id: deleteBtn
                    icon.source: "/icons/delete"
                    icon.width: 32
                    icon.height: 32
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    backgroundVisible: deleteBtn.hovered ? true : false
                }
            }
            ToolBar {
                width: parent.width
                Layout.fillHeight: true

                ColumnLayout {
                    width: parent.width
                    QuickToolButton {
                        icon.source: "/icons/size_plus"
                        implicitWidth: 32
                        implicitHeight: 32
                        icon.width: 32
                        icon.height: 32
                        Layout.topMargin: 5
                        Layout.alignment: Qt.AlignHCenter
                        backgroundVisible: hovered ? true : false
                    }
                    QuickToolButton {
                        implicitWidth: 32
                        implicitHeight: 32
                        icon.source: "/icons/brightness"
                        icon.width: 32
                        icon.height: 32
                        Layout.alignment: Qt.AlignHCenter
                        backgroundVisible: hovered ? true : false
                    }
                    QuickToolButton {
                        implicitWidth: 32
                        implicitHeight: 32
                        icon.source: "/icons/contrast"
                        icon.width: 32
                        icon.height: 32
                        Layout.alignment: Qt.AlignHCenter
                        backgroundVisible: hovered ? true : false
                    }
                }
            }
        }

    }

    Component.onCompleted:  {
        console.log("图库 加载完成。")
    }
}

