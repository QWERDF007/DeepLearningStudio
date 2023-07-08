import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import dl.studio.theme 1.0

Item {
    width: 400
    height: 600

//    ScrollView {
//        id: scroll
//        anchors.fill: parent
//        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
//        ScrollBar.vertical.policy: ScrollBar.AsNeeded
//        ScrollBar.vertical.width: 8
//        ScrollBar.vertical.active: true
//        contentWidth: availableWidth

//        ColumnLayout {
//            width: scroll.availableWidth
////            height: gv1.height + gv2.height

//            GridView {
//                id: gv1
////                Layout.fillWidth: true
//                width: scroll.availableWidth
//                height: contentHeight
////                Layout.fillHeight: true
////                height: 500
//                cellHeight: 120
//                cellWidth: 120
//                model: 150
//                delegate: Column {
//                    Rectangle {
//                        width: 100
//                        height: 100
//                        color: "blue"
//                    }

//                    Label {
//                        text: index
//                    }
//                }
//            }

//            GridView {
//                id: gv2
//                Layout.fillWidth: true
////                height: contentHeight
////                height: 500
//                cellHeight: 120
//                cellWidth: 120
//                model: 150
//                delegate: Column {
//                    Rectangle {
//                        width: 100
//                        height: 100
//                        color: "blue"
//                    }

//                    Label {
//                        text: index
//                    }
//                }
//            }
//        }
//    }



    ListView {
        id: listView
        anchors.leftMargin: 10
        orientation: ListView.Vertical
        boundsBehavior: Flickable.StopAtBounds
        anchors.fill: parent

        ScrollBar.vertical: ScrollBar {
            id: scrollbar
            policy: listView.contentHeight > listView.height ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff
            width: 8
        }

        model: 2

        delegate: GridView {
            id: gv
            property int gvindex: index
            width: parent.width
            height: contentHeight
            cellHeight: 120
            cellWidth: 120
            model: 100
            delegate: Column {
                Rectangle {
                    width: 100
                    height: 100
                    color: gvindex === 0 ? "green" : "blue"
                    MouseArea {
                        anchors.fill: parent
                        onPressed: {
                            gv.currentIndex = index
                        }
                    }
                }
            }

            highlight: Rectangle { color: "transparent"; border.color: "lightblue"; border.width: 2; radius: 5; z: 2}
            highlightMoveDuration: 0
        }

    }
}















