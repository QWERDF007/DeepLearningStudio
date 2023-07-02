import QtQuick.Layouts
import QtQuick
import QtQuick.Controls

ColumnLayout {
    id: root
    property bool isOpen: false
    property string title: "标题"
    default property alias contentItem: contentLayout.data

    spacing: 5

    Layout.fillWidth: true

    Button {
        id: header
        height: 48
        Layout.fillWidth: true
        Layout.leftMargin: root.Layout.leftMargin
        Layout.rightMargin: root.Layout.rightMargin

        contentItem: Text {
            text: root.title
            horizontalAlignment : Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }
        onPressed: {
            root.isOpen = !root.isOpen
        }
    }

    ColumnLayout {
        id: contentLayout
        Layout.leftMargin: root.Layout.leftMargin
        Layout.rightMargin: root.Layout.rightMargin
        visible: root.isOpen
        Layout.fillWidth: true;
    }
}




