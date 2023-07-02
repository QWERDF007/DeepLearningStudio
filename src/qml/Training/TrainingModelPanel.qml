import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import dl.studio.theme 1.0

Rectangle {
    width: 200
    height: 600
    color: Theme.primary

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
//                anchors.leftMargin: 5
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
//                    console.log(dlModel.count)
                    modelListView.currentIndex = dlModel.count - 1
                }
            }
        }


    }

    ListModel{
        id: dlModel
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

    ListView {
        id: modelListView
        Layout.fillWidth: true
        Layout.fillHeight: true

        ScrollBar.vertical: ScrollBar {
            id: scrollbar
            policy: ScrollBar.AsNeeded
            width: 8
        }
        clip: true
//        spacing: 10
        model: dlModel
        focus: true

        delegate: ModelItemDelegate {
            width: modelListView.width - scrollbar.width
            modelName: model.modelName
            modelType: model.modelType
            onClicked: {
                modelListView.currentIndex = index
            }
        }



        highlightFollowsCurrentItem: false

        highlight: Rectangle {
            width: 8
            height: modelListView.currentItem.contentHeight - modelListView.currentItem.borderWidth * 2
            z: 2
            color: Theme.highlight
            y: modelListView.currentItem.y + modelListView.currentItem.borderWidth * 2
        }
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
