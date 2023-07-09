import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../Components"

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

            WheelHandler {
                onWheel: function handler(event) {
                    let cellScale = event.angleDelta.y * 0.125
                    if (event.modifiers & Qt.ControlModifier) {
                        gridView.cellHeight = Math.min(Math.max(gridView.cellHeight + cellScale, 150), 400)
                        gridView.cellWidth = Math.min(Math.max(gridView.cellWidth + cellScale, 150), 400)
                    } else {
                        if (event.angleDelta.y > 0) {
                            scrollBar.decrease()
                        } else {
                            scrollBar.increase()
                        }
                    }
                    event.accepted = false
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
                    }
                }
                Component.onCompleted: {
                    console.log("add", index)
                }

                Component.onDestruction: {
                    console.log("delete", index)
                }
            }
        }
    }
}

















