import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

Rectangle{
    anchors.fill: parent
    color: QuickColor.BackGround
    SplitView {
        anchors.fill: parent
        anchors.margins: 10
        orientation: Qt.Horizontal

        TrainingLeftPanel {
            SplitView.minimumWidth: 220
            SplitView.maximumWidth: 400
        }

        TrainingCenterPanel {
            SplitView.fillWidth: true
        }

        Component.onCompleted:  {
            console.log("训练 加载完成。")
        }
    }
}


