import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.folderlistmodel

import QuickUI

Rectangle {
    id: fileListPanel
    width: 200
    height: 200
    color: QuickColor.Primary
    clip: true

    FolderListModel {
        id: folderModel
        nameFilters: ["*.jpg", "*.png"]
        folder: "file:///D:/Datasets/Photos/raw"
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 5
        anchors.leftMargin: 5
        anchors.bottomMargin: 5
        Label {
            text: qsTr("文件列表:")
            font.pixelSize: 16
            color: "white"
        }

        ListView {
            id: imageListView
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            orientation: ListView.Vertical
            boundsBehavior: Flickable.StopAtBounds

            model: folderModel

            ScrollBar.vertical: ScrollBar {
                id: scrollbar
                policy: imageListView.contentHeight > imageListView.height ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff
                width: 8
            }

            delegate: Rectangle {
                id: _delegate
                width: imageListView.width - scrollbar.width
                height: 32
                radius: 3
                clip: true
                property bool checked: false
                color: mouseArea.containsMouse ? Qt.lighter(QuickColor.Primary, 1.3) : QuickColor.Primary
                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 5
                    spacing: 4
                    IconImage {
//                        anchors.verticalCenter: parent.verticalCenter
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        source: _delegate.checked ? "/icons/check" : "/icons/circle_unchecked"
                        color: _delegate.checked ? QuickColor.HighLight : palette.brightText
                    }
                    Label {
                        Layout.alignment: Qt.AlignVCenter
                        Layout.fillWidth: true
                        text: model.filePath
                        font.pixelSize: 16
                    }
                }
                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        imageListView.currentIndex = index
                        _delegate.checked = !_delegate.checked
                    }
                }
            }
        }
    }


}
