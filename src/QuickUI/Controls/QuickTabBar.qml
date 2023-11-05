
import QtQuick
import QtQuick.Controls

import QuickUI

TabBar {
    id: control
    height: 40
    width: 200

    property alias highlight: lv.highlight

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
            color: QuickColor.HighLight
            Behavior on x {
                SmoothedAnimation {
                    duration: 300
                    velocity: 500
                }
            }
        }
    }

    background: Rectangle {
        color: QuickColor.Primary
        height: control.height
    }

}



