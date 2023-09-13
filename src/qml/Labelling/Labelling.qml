import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import dl.studio.theme 1.0

import QuickUI

Rectangle {
    anchors.fill: parent
    color: Theme.background

    SplitView {
        anchors.fill: parent
        anchors.margins: 10
        orientation: Qt.Horizontal

        LabellingLeftPanel {
            SplitView.minimumWidth: 160
            SplitView.maximumWidth: 600
            implicitWidth: 240
        }

        LabellingCenterPanel {
            SplitView.fillWidth: true
        }

        LabellingRightPanel {
            SplitView.minimumWidth: 160
            SplitView.maximumWidth: 600
            implicitWidth: 280
        }
    }
}
