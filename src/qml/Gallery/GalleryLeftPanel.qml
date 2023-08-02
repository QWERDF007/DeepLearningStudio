import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../Project"

Item {
//    id: control
    width: 200
    height: 200
    clip: true

    ColumnLayout {
        anchors.fill: parent
        spacing: 5

        ProjectSummary {
            Layout.fillWidth: true
            editable: false
        }

        SplitView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            orientation: Qt.Vertical

            DatasetPanel {
                SplitView.fillHeight: true
            }

            ImageInfoPanel {
                SplitView.minimumHeight: 48
                SplitView.maximumHeight: 400
                implicitHeight: 340
            }

            SelectedInfoPanel {
                SplitView.minimumHeight: 45
                SplitView.maximumHeight: 90
                implicitHeight: 90
            }


        }

        ImageSizePanel {
            Layout.fillWidth: true
            height: 48
        }
    }
}
