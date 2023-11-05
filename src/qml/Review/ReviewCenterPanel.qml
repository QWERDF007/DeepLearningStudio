import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.folderlistmodel

import QuickUI

Item {
    width: 400
    height: 400

    GridView {
        id: gridView
        anchors.fill: parent
        anchors.leftMargin: 10
        boundsBehavior: Flickable.StopAtBounds
        layoutDirection: Qt.LeftToRight
        clip: true
        ScrollBar.vertical: ScrollBar {
            id: scrollBar
            policy: gridView.contentHeight > gridView.height ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff
            width: 8
        }

        model: FolderListModel {
            id: folderModel
            nameFilters: ["*.jpg", "*.png"]
            folder: "file:///D:/Datasets/Photos/raw"
        }

        cellWidth: 256
        cellHeight: 256
        cacheBuffer: 1080

        delegate: Rectangle {
            id: control
            width: gridView.cellWidth - 10
            height: gridView.cellHeight - 10
            clip: true
            color: QuickColor.Primary
            radius: 3

            Image {
                id: image
                anchors.fill: parent
                anchors.margins: 5
                asynchronous: true
                cache: false
                source: folderModel.folder + "/" + model.fileName
                sourceSize.height: parent.width
                sourceSize.width: parent.height
                fillMode: Image.PreserveAspectFit
                BusyIndicator {
                    anchors.centerIn: parent
                    running: image.status === Image.Loading
                }

                Rectangle {
                    visible: image.status === Image.Ready
                    anchors.fill: parent
//                    anchors.margins: 5
                    color: "transparent"
                    border.color: "green"
                }
            }
        }
    }
}
