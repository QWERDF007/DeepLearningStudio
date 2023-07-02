
import QtQuick
import QtQuick.Controls

import dl.studio.theme 1.0

TabBar {
    id: control
    width: parent.width
    background: Rectangle {
        color: Theme.primary
        height: control.height
    }

    contentItem: ListView {
        id: lv
        height: control.height
        currentIndex: control.currentIndex
        model: control.contentModel
        spacing: control.spacing
        orientation: ListView.Horizontal
        boundsBehavior: Flickable.StopAtBounds
        flickableDirection: Flickable.AutoFlickIfNeeded
        snapMode: ListView.SnapToItem
    }
}



