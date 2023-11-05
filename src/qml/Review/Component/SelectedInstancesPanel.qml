import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI
import "../../Labelling/Component"


Rectangle {
    id: selectedInstancesPanel
    width: 200
    height: 200
    color: QuickColor.Primary
    clip: true

    property int contentItemHeight: 24
    property real selectedInstanceWidth: 743.24
    property real selectedInstanceHeight: 505.05
    property int selectedNum: 13
    property int total: 1312

    ListModel {
        id: classesModel
        ListElement { text: "类别1"; color: "yellow"; value: 0 }
        ListElement { text: "类别2"; color: "red"; value: 1 }
    }

    QuickToolButton {
        id: clearBtn
        anchors.top: labelClassesFilterExpander.top
        anchors.right: labelClassesFilterExpander.right
        anchors.topMargin: 5
        anchors.rightMargin: 10
        icon.source: "/icons/close"
        icon.height: 24
        icon.width: 24
        ToolTip {
            id: clearBtnTip
            visible: clearBtn.hovered
            delay: 500
            text: qsTr("清除选择 (Esc)")
        }

        onClicked: {
            console.log("清除选择")
        }
    }

    Label {
        anchors.top: clearBtn.bottom
        anchors.topMargin: 5
        anchors.left: labelClassesFilterExpander.left
        text: selectedInstancesPanel.selectedNum + "/" + selectedInstancesPanel.total + qsTr(" 个标签实例")
        font.pixelSize: 14
    }

    Expander {
        id: labelClassesFilterExpander
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        headerText: "标签类别:"
        headerPixelSize: 16
        headerHeight: 60

        content: ColumnLayout {
            width: parent.width
            spacing: 10
            ColumnLayout {
                Layout.fillWidth: true
                Label {
                    Layout.fillWidth: true
                    opacity: 0.5
                    text: qsTr("图像:")
                    font.pixelSize: 14
                }
                Label {
                    text: "F3f6LKvW4AAgnDi(F3f6LKvW4AAgnDi)-F3f6LKvW4AAgnDi.jpg"
                    font.pixelSize: 14
                    Layout.fillWidth: true
                    wrapMode: Text.WrapAnywhere
                }
            }
            ColumnLayout {
                Layout.fillWidth: true
                Label {
                    Layout.fillWidth: true
                    opacity: 0.5
                    text: qsTr("标签类别:")
                    font.pixelSize: 14
                }
                LabelClassComboBox {
                    Layout.fillWidth: true
                    displayLabelText: qsTr("不同类别")
                    colorVisible: false
                    model: classesModel
                    implicitHeight: selectedInstancesPanel.contentItemHeight
                    onActivated: function(index) {
                        displayLabelText = displayText
                        if (!colorVisible) {
                            colorVisible = true
                        }
                        if (!selectedInstanceProperty.visible) {
                            selectedInstanceProperty.visible = true
                        }
                    }
                }
            }
            Label {
                id: selectedInstanceProperty
                Layout.fillWidth: true
                visible: false
                text: selectedInstanceWidth + " x " +  selectedInstanceHeight
                font.pixelSize: 14
                wrapMode: Text.WrapAnywhere
            }
        }
    }
}
