import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../Project"


Item {
    id: root
    implicitWidth: 280
//    color: Theme.primary

    ColumnLayout {
        anchors.fill: parent

        ProjectSummary {
            Layout.fillWidth: true
//            Layout.fillHeight: true
            editable: false
        }

        TrainingModelPanel {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }


}
