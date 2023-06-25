import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import dl.studio.theme 1.0

Rectangle{
    anchors.fill: parent
    color: Theme.backgroundColor
    SplitView {
        anchors.fill: parent
        anchors.margins: 10
        orientation: Qt.Horizontal

        TrainingLeftPane {

        }

        Rectangle {
            id: centerItem
            anchors.margins: 10
            SplitView.fillWidth: true
            color: Theme.backgroundColor
            Label {
                text: "View 2"
                anchors.centerIn: parent
            }
        }

        Component.onCompleted:  {
            console.log("训练 加载完成。")
        }
    }
}


