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

    property int contentItemHeight: 28

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 5
        RowLayout {
            Layout.fillWidth: true
            implicitHeight: _labelInstanceEditor.contentItemHeight
            Label {
                Layout.preferredWidth: 48
                height: parent.height
                font.pixelSize: 16
                text: qsTr("类别")
            }
            ComboBox {
                id: _comboBox
                implicitHeight: parent.height
                topInset: 0
                bottomInset: 0
                Layout.fillWidth: true
                textRole: "text"
                valueRole: "value"
                model: ListModel {
                    id: _classesModel
                    ListElement { text: "类别1"; color: "yellow"; value: 0 }
                    ListElement { text: "类别2"; color: "red"; value: 1 }
                }

                delegate: ItemDelegate {
                    height: _labelInstanceEditor.contentItemHeight
                    width: _comboBox.width
                    contentItem: RowLayout {
                        anchors.fill: parent
                        anchors.margins: 5
                        Rectangle {
                            implicitHeight: 16
                            implicitWidth: 16
                            radius: 3
                            color: model.color
                            border.width: 1
                            border.color: "black"
                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        }
                        Label {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            text: model.text
                            font.pixelSize: 16
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }

                contentItem: RowLayout {
                    Rectangle {
                        implicitHeight: 16
                        implicitWidth: 16
                        radius: 3
                        color: _comboBox.currentIndex !== -1 ? _classesModel.get(_comboBox.currentIndex).color : "transparent"
                        border.width: 1
                        border.color: "black"
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        Layout.leftMargin: 5
                    }
                    Label {
                        Layout.fillWidth: true
                        //                        Layout.fillHeight: true
                        text: _comboBox.displayText
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                onActivated: function(index) {
                    console.log("LabelInstanceEditor comboBox onActivated", index)
                }
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
                implicitWidth: parent.width
                implicitHeight: _labelInstanceEditor.contentItemHeight

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
