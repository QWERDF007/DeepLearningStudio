import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "./MainWindow"
import dl.studio.theme 1.0

ApplicationWindow  {
    //Window {
    width: Theme.width
    height: Theme.height
    visible: true
    color: Theme.background


    title: qsTr("MainWindow")

    // 菜单栏
//    menuBar: MenuBar {

//    }

    //标题栏
    header: MainHeader {
        id: mainHeader
        height: 48
    }



    MainStackLayout {
        anchors.fill: parent
        currentIndex: mainHeader.currentIndex
    }

    footer: Rectangle {
        height: 28
        width: parent.width
        color: Theme.primary
    }

    Component.onCompleted: {
        console.log("main complete.", Theme, Theme.background)
    }
}

