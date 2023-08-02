import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import dl.studio.theme 1.0

Rectangle {
    width: 400
    height: 400
    anchors.fill: parent
    color: Theme.background

    SplitView {
        anchors.fill: parent
        anchors.margins: 10
        orientation: Qt.Horizontal

        GalleryLeftPanel {
            SplitView.minimumWidth: 160
            SplitView.maximumWidth: 600
            implicitWidth: 280
        }

        GalleryCenterPanel {
            SplitView.fillWidth: true
        }
    }

    Component.onCompleted:  {
        console.log("图库 加载完成。")
    }
}
