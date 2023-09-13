import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    width: 400
    height: 600
//    anchors.fill: parent
    Image {
        anchors.fill: parent
        source: "file:///D:/Datasets/Photos/raw/F3f6LKvW4AAgnDi.jpg"
        sourceSize.width: Math.min(parent.width, parent.height)
        sourceSize.height: Math.min(parent.width, parent.height)
        fillMode: Image.PreserveAspectFit
    }
}
