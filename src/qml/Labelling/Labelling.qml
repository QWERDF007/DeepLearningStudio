import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    anchors.fill: parent

    Keys.onPressed: (event)=> {
        console.log("labelling", event.key)
    }
}
