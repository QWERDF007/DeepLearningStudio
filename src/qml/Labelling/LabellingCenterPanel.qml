import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./Component"

Item {
    id: _labellingCenter
    width: 400
    height: 600
    clip: true
//    color: "transparent"
//    border.color: "green"
//    border.width: 1

    LabelRegion {
        width: parent.width
        height: parent.height
    }
}
