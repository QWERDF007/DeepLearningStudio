import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import dl.studio.theme 1.0

Rectangle{
    anchors.fill: parent
    color: Theme.background
    SplitView {
        anchors.fill: parent
        anchors.margins: 10
        orientation: Qt.Horizontal

        ProjectLeftPanel {
            SplitView.minimumWidth: 160
            SplitView.maximumWidth: 600
            implicitWidth: 280
        }

        ProjectCenterPanel {
            SplitView.fillWidth: true
        }

        Component.onCompleted:  {
            console.log("训练 加载完成。")
        }
    }
}


