
import QtQuick
import QtQuick.Controls

TabBar {
    id: control
    width: parent.width
//    height: parent.height
    background: Rectangle {
        color: Theme.primary
        height: control.height
    }

    spacing: 1

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

        highlightFollowsCurrentItem: false
        highlight: Rectangle {
            x: lv.currentItem.x
            z: 2
            y: lv.height - height
            height: 2
            width: 100
            color: Theme.highlight
            Behavior on x {
                SmoothedAnimation {
                    duration: 300
                    velocity: 500
                }
            }
        }
    }
}



