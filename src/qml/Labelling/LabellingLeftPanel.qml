import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./Component"
import "../Gallery/Component" as Gallery

Item {
    width: 200
    height: 200

    ColumnLayout {
        anchors.fill: parent
        spacing: 5

        ImageFlipPanel {
            Layout.fillWidth: true
            implicitHeight: 96
        }

        SplitView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            orientation: Qt.Vertical

            Gallery.DatasetPanel {
                SplitView.fillHeight: true
            }

            LabelClassesPanel {
                SplitView.minimumHeight: 240
                SplitView.maximumHeight: 600
                implicitHeight: 400
            }
        }
    }
}
