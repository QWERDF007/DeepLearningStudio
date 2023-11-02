import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

Rectangle {
    width: 200
    height: 200
    color: QuickColor.Primary

    QuickToolButton {
        anchors.top: labelClassesExpander.top
        anchors.right: labelClassesExpander.right
        anchors.topMargin: 3
        anchors.rightMargin: 8
        padding: 4
        backgroundVisible: hovered
        ToolTip.visible: hovered
        ToolTip.delay: 500
        ToolTip.text: qsTr("添加数据集")
        icon.source: "/icons/add"
        icon.height: 24
        icon.width: 24

        onClicked: {
            console.log("添加标签类别")
        }
    }

    ListModel {
        id: labelClassesModel
        ListElement { text: "背景"; color: "gray"; shortcut: "0" }
        ListElement { text: "标签1"; color: "yellow"; shortcut: "1" }
        ListElement { text: "标签3"; color: "green"; shortcut: "2" }
        ListElement { text: "标签4"; color: "blue"; shortcut: "3" }
        ListElement { text: "标签5"; color: "red"; shortcut: "4" }
        ListElement { text: "标签6"; color: "lightgreen"; shortcut: "" }
        ListElement { text: "标签7"; color: "lightblue"; shortcut: "6" }
        ListElement { text: "标签8"; color: "pink"; shortcut: "" }
        ListElement { text: "标签9"; color: "lightgray"; shortcut: "8" }
    }

    Expander {
        id: labelClassesExpander
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        headerText: "标签类别:"
        headerHeight: 36
        headerPixelSize: 16

        content: LabelClassesView {
            width: parent.width
            height: parent.height
            model: labelClassesModel
        }
    }
}
