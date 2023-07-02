import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import dl.studio.theme 1.0

Item {
    id: root
    width: 200
    height: 200
    //    color: Theme.primary

    ColumnLayout {
        anchors.fill: parent


        Rectangle {
            Layout.fillWidth: true
            height: 110
            color: Theme.primary
            ColumnLayout {
                anchors.fill: parent
                spacing: 0
                Button {
                    Material.roundedScale: Material.ExtraSmallScale
                    implicitHeight: 48
                    Layout.fillWidth: true
                    Layout.topMargin: 5
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    text: qsTr("新建项目")
                    font.pointSize: 12
                    icon.source: "/icons/file"
                }

                Button {
                    Material.roundedScale: Material.ExtraSmallScale
                    implicitHeight: 48
                    Layout.fillWidth: true
                    Layout.bottomMargin: 5
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    text: qsTr("打开项目")
                    font.pointSize: 12
                    icon.source: "/icons/folder"
                }
            }
        }




        ProjectSummary {
            Layout.fillWidth: true
            editable: true
        }

        ProjectDescription {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }


}
