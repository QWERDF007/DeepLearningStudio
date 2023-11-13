import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI
import "Component"

Item {
    width: 400
    height: 600
    clip: true
    SplitView {
        anchors.fill: parent
        orientation: Qt.Vertical
        LabelClassesFilterPanel {
            SplitView.minimumHeight: 200
            implicitHeight: 400
            SplitView.fillWidth: true
        }

        SelectedInstancesPanel {
            SplitView.minimumHeight: 200
            SplitView.fillWidth: true
        }
    }
}
