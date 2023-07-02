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

        EvalLeftPanel {
            id: leftItem
        }

        EvalCenterPanel {
            id: centerItem
            SplitView.fillWidth: true
//            color: Theme.background
            anchors.margins: 10
            Label {
                text: "View 2"
                anchors.centerIn: parent
            }
        }

        Component.onCompleted:  {
            console.log("评估 加载完成。")
        }
    }
}


