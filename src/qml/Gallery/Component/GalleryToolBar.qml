import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

ColumnLayout {
    implicitWidth: 36
    spacing: 3
    ToolBar {
        width: parent.width
        QuickToolButton {
            icon.source: "/icons/delete"
            icon.width: 32
            icon.height: 32
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            backgroundVisible: hovered ? true : false
        }
    }
    ToolBar {
        width: parent.width
        Layout.fillHeight: true

        ColumnLayout {
            width: parent.width
            QuickToolButton {
                icon.source: "/icons/size_plus"
                implicitWidth: 32
                implicitHeight: 32
                icon.width: 32
                icon.height: 32
                Layout.topMargin: 5
                Layout.alignment: Qt.AlignHCenter
                backgroundVisible: hovered ? true : false
            }
            QuickToolButton {
                implicitWidth: 32
                implicitHeight: 32
                icon.source: "/icons/brightness"
                icon.width: 32
                icon.height: 32
                Layout.alignment: Qt.AlignHCenter
                backgroundVisible: hovered ? true : false
            }
            QuickToolButton {
                implicitWidth: 32
                implicitHeight: 32
                icon.source: "/icons/contrast"
                icon.width: 32
                icon.height: 32
                Layout.alignment: Qt.AlignHCenter
                backgroundVisible: hovered ? true : false
            }
        }
    }
}
