import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI


Rectangle {
    width: 200
    height: 600
    color: QuickColor.Primary

    ListModel{
        id: dlModelList
        ListElement{
            modelName: "abababab"
            modelType: "yolov5"
        }
        ListElement{
            modelName: "acaca"
            modelType: "yolov8"
        }
        ListElement{
            modelName: "bbbb"
            modelType: "deeplabv3+"
        }
        ListElement{
            modelName: "ddddd"
            modelType: "SAM"
        }
        ListElement{
            modelName: "ffff"
            modelType: "U-net"
        }
    }

    ColumnLayout {
        anchors.fill: parent

        Item {
            Layout.fillWidth: true
            height: 80
            Column {
                anchors.fill: parent
                anchors.leftMargin: 5
                anchors.topMargin: 5
                Label {
                    anchors.left: parent.left
                    text: qsTr("模型训练:")
                }
                Button {
                    id: addModelBtn
                    anchors.left: parent.left

                    Material.roundedScale: Material.ExtraSmallScale
                    implicitWidth: 65
                    implicitHeight: 42
                    Label {
                        anchors.centerIn: parent
                        text: qsTr("创建模型")
                        font.pointSize: 10
                    }
                    onClicked: {
                        modelListView.model.append({modelName: Qt.formatDateTime(new Date(), "yy-MM-dd hh:mm:ss"), modelType: "abab"})
                        modelListView.currentIndex = dlModel.count - 1
                    }
                }
            }
        }

        ModelListView {
            model: dlModelList
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Button {
            id: button
            implicitHeight: 40
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
