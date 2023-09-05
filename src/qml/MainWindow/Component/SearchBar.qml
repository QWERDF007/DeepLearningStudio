import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QuickUI

RowLayout {
    spacing: 0
    QuickTextField {
        id: searchInput
        implicitWidth: 200
        implicitHeight: 32

        placeholderText: qsTr("输入筛选文本")
        Layout.alignment: Qt.AlignHCenter
    }


    QuickToolButton {
        icon.source: "/icons/search"
        implicitWidth: 32
        implicitHeight: 32
        icon.width: 32
        icon.height: 32
        Layout.alignment: Qt.AlignHCenter
        backgroundVisible: hovered ? true : false
    }
}
