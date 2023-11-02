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

    property int labelColorRectSize: Math.min(width, height) - 12
    property int labelColorRectRadius: 3
    property int fontPixelSize: 16

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

    contentItem: RowLayout {
        Rectangle {
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
            Layout.fillWidth: true
            text: labelClassComboBox.displayText
            font.pixelSize: fontPixelSize
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }
    }

    onActivated: function(index) {
        console.log("LabelInstanceEditor comboBox onActivated", index)
    }
}
