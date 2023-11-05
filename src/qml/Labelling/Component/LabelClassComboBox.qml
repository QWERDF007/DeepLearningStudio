import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

ComboBox {
    id: labelClassComboBox
    topInset: 0
    bottomInset: 0
    textRole: "text"
    valueRole: "value"

    property int labelColorRectSize: Math.max(Math.min(implicitWidth, implicitHeight) - 8, 16)
    property int labelColorRectRadius: 3
    property int fontPixelSize: 16
    property alias displayLabelText: displayLabel.text
    property bool colorVisible: true

    // 弹窗的
    delegate: ItemDelegate {
        height: labelClassComboBox.height
        width: labelClassComboBox.width
        contentItem: RowLayout {
            anchors.fill: parent
            anchors.margins: 5
            Rectangle {
                height: labelColorRectSize
                width: labelColorRectSize
                radius: labelColorRectRadius
                color: model.color
                border.width: 1
                border.color: "black"
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            }
            Label {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: model.text
                font.pixelSize: fontPixelSize
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    // 显示选中的内容
    contentItem: RowLayout {
        Rectangle {
            visible: labelClassComboBox.colorVisible
            height: labelColorRectSize
            width: labelColorRectSize
            radius: labelColorRectRadius
            color: labelClassComboBox.currentIndex !== -1 ? labelClassComboBox.model.get(labelClassComboBox.currentIndex).color : "transparent"
            border.width: 1
            border.color: "black"
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            Layout.leftMargin: 5
        }
        Label {
            id: displayLabel
            Layout.fillWidth: true
            Layout.leftMargin: 5
            text: labelClassComboBox.displayText
            font.pixelSize: fontPixelSize
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }
    }
}
