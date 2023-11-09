import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI


ListView {
    id: modelListView
    clip: true
    width: 200
    height: 200
    orientation: ListView.Vertical
    boundsBehavior: Flickable.StopAtBounds

    ScrollBar.vertical: ScrollBar {
        id: scrollbar
        policy: modelListView.contentHeight > modelListView.height ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff
        width: 8
    }

    delegate: ModelItemDelegate {
        width: modelListView.width - scrollbar.width
        modelName: model.modelName
        modelType: model.modelType
        onClicked: {
            modelListView.currentIndex = index
        }
    }



    highlightFollowsCurrentItem: false

    highlight: Rectangle {
        width: 8
        height: modelListView.currentItem.contentHeight - modelListView.currentItem.borderWidth * 2
        z: 2
        color: QuickColor.HighLight
        y: modelListView.currentItem.y + modelListView.currentItem.borderWidth * 2
    }
}
