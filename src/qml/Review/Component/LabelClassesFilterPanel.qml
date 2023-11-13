import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI
import "../../Labelling/Component"

Rectangle {
    id: labelClassFilterPanel
    width: 200
    height: 200
    color: QuickColor.Primary
    clip: true

    ListModel {
        id: labelClassesFilterModel
        ListElement { text: "背景"; color: "gray"; shortcut: "0" }
        ListElement { text: "标签2"; color: "yellow"; shortcut: "1" }
        ListElement { text: "标签3"; color: "green"; shortcut: "5" }
        ListElement { text: "标签4"; color: "blue"; shortcut: "3" }
        ListElement { text: "标签5"; color: "red"; shortcut: "4" }
        ListElement { text: "标签6"; color: "lightgreen"; shortcut: "" }
        ListElement { text: "标签7"; color: "lightblue"; shortcut: "6" }
        ListElement { text: "标签10"; color: "pink"; shortcut: "a" }
        ListElement { text: "标签9"; color: "lightgray"; shortcut: "8" }
    }

    QuickToolButton {
        id: addBtn
        anchors.top: labelClassesFilterExpander.top
        anchors.right: labelClassesFilterExpander.right
        anchors.topMargin: 5
        anchors.rightMargin: 10
        padding: 4
        icon.source: "/icons/add"
        icon.height: 24
        icon.width: 24
        ToolTip {
            id: addBtnTip
            visible: addBtn.hovered
            delay: 500
            text: qsTr("添加标签")
        }

        onClicked: {
            console.log("添加标签")
        }
    }

    Expander {
        id: labelClassesFilterExpander
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        headerText: "标签类别:"
        headerHeight: 36
        headerPixelSize: 16

        content: ColumnLayout {
            width: parent.width
            height: parent.height
            RowLayout {
                Layout.rightMargin: 10
                Layout.fillWidth: true
                spacing: 3
                Label {
                    text: qsTr("若要显示实例的子集, 请选择一个或多个标签类别:")
                    Layout.fillWidth: true
                    font.pixelSize: 14
                    wrapMode: Text.WrapAnywhere
                    Component.onCompleted: {
                        console.log("abcdefg", width, height, parent.width, parent.height)
                    }
                }
                QuickToolButton {
                    id: clearBtn
                    Layout.alignment: Qt.AlignRight
                    icon.source: "/icons/close"
                    icon.height: 24
                    icon.width: 24
                    ToolTip {
                        id: clearBtnTip
                        visible: clearBtn.hovered
                        delay: 500
                        text: qsTr("清除筛选器")
                    }

                    onClicked: {
                        console.log("清除筛选器")
                    }
                }
            }

            LabelClassesView {
                Layout.fillWidth: true
                Layout.fillHeight: true
                model: labelClassesFilterModel

            }
        }
    }


}
