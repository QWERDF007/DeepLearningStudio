import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

//import "../Components"
import QuickUI

import dl.studio.theme 1.0

Item {
    id: root
    width: 400
    height: 600



    Expander {
        anchors.fill: parent
        anchors.leftMargin: 10
        headerText: "最近的项目:"
        content: GridView {
            id: gridView
            anchors.fill: parent
            boundsBehavior: Flickable.StopAtBounds

            ScrollBar.vertical: ScrollBar {
                id: scrollBar
                policy: gridView.contentHeight > gridView.height ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff
                width: 8
            }
            clip: true
            cacheBuffer: cellHeight * 2
            cellHeight: 200
            cellWidth: 200
            model: 100

            onCurrentIndexChanged: {
                console.log("currentIndex", currentIndex)
            }

            WheelHandler {
                acceptedModifiers: Qt.ControlModifier
                onWheel: function handler(event) {
                    let cellScale = event.angleDelta.y * 0.125

                    gridView.cellHeight = Math.min(Math.max(gridView.cellHeight + cellScale, 150), 400)
                    gridView.cellWidth = Math.min(Math.max(gridView.cellWidth + cellScale, 150), 400)

                    console.log(cellScale, gridView.cellHeight,gridView.cellWidth)
                }
            }

            delegate: Rectangle {
                id: control
                width: gridView.cellWidth - 10
                height: gridView.cellHeight - 10
                color: "transparent"
                border.color: "#3E3E3E"
                border.width: 2
                clip: true
                Column {
                    anchors.fill: parent
                    anchors.margins: parent.border.width
                    Rectangle {
                        width: parent.width
                        height: parent.height - desc.height
                        color: "transparent"
                        border.color: gridView.currentIndex === index ? Theme.highlight : "transparent"
                        border.width: 4
                        Image {
                            id: image
                            anchors.fill: parent
                            anchors.margins: parent.border.width
                            asynchronous: true
                            source: "file:///D:/Datasets/Photos/raw/FuVSc7GakAAS0ZC.jpg"
                            clip: true
                            fillMode: Image.PreserveAspectCrop
                        }
                    }
                    Label {
                        id: desc
                        clip: true
                        text: image.source
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        gridView.currentIndex = index
                        control.forceActiveFocus()
                    }
                }

                Component.onCompleted: {
//                    console.log("add", index)
                }

                Component.onDestruction: {
//                    console.log("delete", index)
                }
            }
        }
    }

    // 鼠标区域, 覆盖 GridView, 修改滚轮+Ctrl的行为, 保持流畅的滚动效果
//    MouseArea {
//        anchors.fill: parent
//        onPressed: (mouse)=> { mouse.accepted = false }
//        onClicked: (mouse)=> { mouse.accepted = false }
//        onDoubleClicked: (mouse)=> { mouse.accepted = false }
//        onReleased: (mouse)=> { mouse.accepted = false }
//        onWheel: (mouse)=> {
//            let cellScale = mouse.angleDelta.y * 0.125
//            if (mouse.modifiers & Qt.ControlModifier) {
//                gridView.cellHeight = Math.min(Math.max(gridView.cellHeight + cellScale, 150), 400)
//                gridView.cellWidth = Math.min(Math.max(gridView.cellWidth + cellScale, 150), 400)
//                mouse.accepted = true
//            } else {
//                mouse.accepted = false
//            }
//        }
//    }
}

















