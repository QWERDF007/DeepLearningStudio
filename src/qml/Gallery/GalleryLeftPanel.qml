import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../Project"
import "Component"


Item {
    id: galleryLeftPanel
    width: 200
    height: 200
    clip: true

    property alias sizeScaleFrom: imageSizePanel.sizeScaleFrom
    property alias sizeScaleValue: imageSizePanel.sizeScaleValue
    property alias sizeScaleTo: imageSizePanel.sizeScaleTo
    property alias sizeScaleStepSize: imageSizePanel.sizeScaleStepSize


    ColumnLayout {
        anchors.fill: parent
        spacing: 5

        SplitView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            orientation: Qt.Vertical

            DatasetPanel {
                SplitView.fillHeight: true
            }

            ImageInfoPanel {
                SplitView.minimumHeight: 48
                SplitView.maximumHeight: 480
                implicitHeight: 360
            }

            SelectedInfoPanel {
                SplitView.minimumHeight: 45
                SplitView.maximumHeight: 90
                implicitHeight: 90
            }


        }

        ImageSizePanel {
            id: imageSizePanel
            Layout.fillWidth: true
            height: 48
        }
    }
}
