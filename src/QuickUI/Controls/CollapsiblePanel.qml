import QtQuick.Layouts
import QtQuick
import QtQuick.Controls

ColumnLayout {
    id: control
    property bool isOpen: false
    property string title: "标题"
    default property alias contentItem: contentLayout.data

    spacing: 5

    Layout.fillWidth: true

    Button {
        id: header
        height: 48
        Layout.fillWidth: true
        Layout.leftMargin: control.Layout.leftMargin
        Layout.rightMargin: control.Layout.rightMargin

        contentItem: Text {
            text: control.title
            horizontalAlignment : Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }
        onPressed: {
            control.isOpen = !control.isOpen
        }
    }

    ColumnLayout {
        id: contentLayout
        Layout.leftMargin: control.Layout.leftMargin
        Layout.rightMargin: control.Layout.rightMargin
        visible: control.isOpen
        Layout.fillWidth: true;
    }
}




