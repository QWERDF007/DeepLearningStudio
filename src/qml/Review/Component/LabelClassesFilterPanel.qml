import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI
import "../../Labelling/Component"

Rectangle {
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

    Expander {
        id: labelClassesFilterExpander
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
            model: labelClassesFilterModel
        }
    }
}
