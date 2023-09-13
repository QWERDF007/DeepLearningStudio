import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./Component"

Item {
    width: 200
    height: 200

    SplitView {
        anchors.fill: parent
        orientation: Qt.Vertical

        LabelSettingsPanel {
            Layout.fillWidth: true
            SplitView.minimumHeight: 96
            SplitView.maximumHeight: 480
            implicitHeight: 200
        }
        LabelInstancesPanel {
            SplitView.fillHeight: true
            SplitView.fillWidth: true
            SplitView.minimumHeight: 96
        }
        LabelInstanceEditorPanel {
            SplitView.fillWidth: true
            SplitView.minimumHeight: 96
            implicitHeight: 200
        }
    }
}
