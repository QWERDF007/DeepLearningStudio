import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

Rectangle {
    id: root
    implicitWidth: 280
    SplitView.minimumWidth: 220
    SplitView.maximumWidth: 400
    color: QuickColor.Primary

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
            id: lv
            Layout.fillWidth: true
            Layout.fillHeight: true
            ScrollBar.vertical: ScrollBar {
                id: scrollbar
                policy: ScrollBar.AsNeeded
                width: 8
            }
            clip: true
            spacing: 4
            model: dlModel

            delegate: Rectangle {
                width: root.width - scrollbar.width
                height: 200
                color: model.color
            }
        }

        Button {
            id: button
            height: 46
            Material.roundedScale: Material.ExtraSmallScale
            text: qsTr("开始评估")
            font.pointSize: 12
            Layout.alignment: Qt.AlignBottom
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            Layout.fillWidth: true
        }
    }


}
