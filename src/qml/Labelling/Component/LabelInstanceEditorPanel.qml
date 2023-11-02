import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

Rectangle {
    id: _labelInstanceEditor
    implicitHeight: 200
    implicitWidth: 200
    color: QuickColor.Primary
    clip: true

    property int contentItemHeight: 24

    ListModel {
        id: classesModel
        ListElement { text: "类别1"; color: "yellow"; value: 0 }
        ListElement { text: "类别2"; color: "red"; value: 1 }
    }


    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 5
        Label {
            Layout.fillWidth: true
            height: parent.height
            font.pixelSize: 16
            text: qsTr("编辑所选标签实例:")
        }
        RowLayout {
            Layout.fillWidth: true
            height: _labelInstanceEditor.contentItemHeight
            Label {
                Layout.preferredWidth: 48
                height: parent.height
                font.pixelSize: 16
                text: qsTr("类别")
            }
            LabelClassComboBox {
                model: classesModel
                implicitHeight: parent.height
                Layout.fillWidth: true
            }
        }

        ListView {
            Layout.fillWidth: true
            implicitHeight: childrenRect.height
            orientation: ListView.Vertical
            boundsBehavior: Flickable.StopAtBounds
            spacing: 5
            clip: true
            model: ListModel {
                ListElement { name: "X"; value: 15}
                ListElement { name: "Y"; value: 78}
                ListElement { name: "宽度"; value: 15}
                ListElement { name: "高度"; value: 24}
            }

            delegate: RowLayout {
                width: parent.width
                height: _labelInstanceEditor.contentItemHeight

                Label {
                    Layout.preferredWidth: 48
                    height: parent.height
                    font.pixelSize: 16
                    text: model.name
                }
                SpinBox {
                    Layout.fillWidth: true
                    implicitHeight: parent.height
                    font.pixelSize: 16
                    value: model.value
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
