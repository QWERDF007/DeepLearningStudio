
import QtQuick
import QtQuick.Controls

import dl.studio.theme 1.0

TabBar {
    id: control
    width: parent.width
//    height: parent.height
    background: Rectangle {
        color: Theme.primaryColor
        height: control.height
        Component.onCompleted: {
            console.log("TabBar background height", control.height)
        }
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
            y: lv.height - height - 2
            height: 2
            width: 100
            color: Theme.highlightColor
            Behavior on x {
                SmoothedAnimation {
                    duration: 300
                    velocity: 500
                }
            }
        }
    }

    Component.onCompleted: {
        console.log("TabBar height", control.height)
    }

}



