import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Qt.labs.folderlistmodel

import dl.studio.theme 1.0

Item {
    width: 400
    height: 400

    property real cellScaleFrom: 0.5
    property real cellScaleValue: 1.0
    property real cellScaleTo: 2
    property real cellScaleStepSize: 0.25

    property alias gridModel: gridView.model

    FolderListModel {
        id: folderModel
        nameFilters: ["*.jpg", "*.png"]
        folder: "file:///D:/Datasets/Photos/raw"
    }

    GridView {
        id: gridView
        anchors.fill: parent
        anchors.leftMargin: 10
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar {
            id: scrollBar
            policy: gridView.contentHeight > gridView.height ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff
            width: 8
        }

        onCurrentIndexChanged: {
            console.log("currentIndex", currentIndex)
        }

        layoutDirection: Qt.LeftToRight

        clip: true
        cacheBuffer: 1080
        cellHeight: 320 * cellScaleValue + 10
        cellWidth: 320 * cellScaleValue + 10
//        model: 100
        model: folderModel

        WheelHandler {
            acceptedModifiers: Qt.ControlModifier
            onWheel: function handler(event) {
                if (event.modifiers) {
                    if (event.angleDelta.y > 0 && cellScaleValue < cellScaleTo) {
                        cellScaleValue += cellScaleStepSize
                    } else if (event.angleDelta.y < 0 && cellScaleValue > cellScaleFrom) {
                        cellScaleValue -= cellScaleStepSize
                    } else {

                    }
                }
                console.log(cellScaleValue, cellScaleFrom, cellScaleTo, cellScaleStepSize, gridView.cellHeight,gridView.cellWidth)
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
                    Component.onCompleted: {
                        folderModel.folder + "/" + model.fileName
                    }

                    Image {
                        id: image
                        anchors.fill: parent
                        anchors.margins: parent.border.width
                        asynchronous: true
                        cache: false
//                                                source: "file:///D:/Datasets/Photos/raw/FuVSc7GakAAS0ZC.jpg"
                        source: folderModel.folder + "/" + model.fileName
//                        source: "file:///" + modelData
//                        sourceSize.height: control.height
//                        sourceSize.width: control.width
                        clip: true
                        fillMode: Image.PreserveAspectFit
                        //                        sourceSize.width: gridView.cellWidth
                        //                        sourceSize.height: gridView.cellHeight
                        BusyIndicator {
                            anchors.centerIn: parent
                            running: image.status === Image.Loading
                        }
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
//                console.log("add", index)
            }

            Component.onDestruction: {
//                console.log("delete", index)
            }
        }
    }
}
