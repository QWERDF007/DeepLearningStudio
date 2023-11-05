import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI
import "./Component"

Rectangle {
    width: 400
    height: 400
    anchors.fill: parent
    color: QuickColor.BackGround
    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 0
        SplitView {
            orientation: Qt.Horizontal
            Layout.fillWidth: true
            Layout.fillHeight: true

            ReviewLeftPanel {
                SplitView.minimumWidth: 160
                SplitView.maximumWidth: 600
                implicitWidth: 240
            }

            ReviewCenterPanel {
                SplitView.fillWidth: true
            }
        }
        ReviewToolBar {

        }
    }
}
