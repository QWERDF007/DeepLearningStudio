import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import dl.studio.theme 1.0

Rectangle {
    id: leftItem
    implicitWidth: 280
    SplitView.minimumWidth: 220
    SplitView.maximumWidth: 400
    color: Theme.primaryColor

    ListModel{
        id: dlModel
        ListElement{
            color: "blue"
        }
        ListElement{
            color: "green"
        }
        ListElement{
            color: "yellow"
        }
        ListElement{
            color: "pink"
        }
        ListElement{
            color: "lightgray"
        }
    }

    ColumnLayout {
        anchors.fill: parent
        Rectangle {
            Layout.fillWidth: true
            height: 200
            color: "red"
        }



        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            spacing: 10
            model: dlModel
            delegate: Rectangle{
                width: parent.width
                height: 200
                color: model.color
            }
        }

        Button {
            id: button
            height: 46
            Material.roundedScale: Material.ExtraSmallScale
            text: qsTr("开始训练")
            font.pointSize: 12
            Layout.alignment: Qt.AlignBottom
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            Layout.fillWidth: true
        }
    }


}
