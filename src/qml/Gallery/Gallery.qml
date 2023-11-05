import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI
import "./Component"

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

        GalleryToolBar {

        }
    }

    Component.onCompleted:  {
        console.log("图库 加载完成。")
    }
}

