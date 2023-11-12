import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

ComboBox {
    id: datasetComboBox
    topInset: 0
    bottomInset: 0
    textRole: "text"
    valueRole: "value"

    property int fontPixelSize: 16
    property alias displayLabelText: displayLabel.text
    property bool colorVisible: true
    property real contentItemMaxWidth: 12

    onContentItemMaxWidthChanged: {
        // 将弹窗宽度设为子控件最大宽度
        if (datasetComboBox.contentItemMaxWidth > datasetComboBox.width) {
            _popup.width = datasetComboBox.contentItemMaxWidth + 24
        } else {
            _popup.width = datasetComboBox.width
        }
    }

    // 弹窗的代理的界面显示
    delegate: QuickCheckBox {
        id: _delegate
        padding: 0
        height: 20
        text: model.text
        font.pixelSize: 14
        indicatorItem.width: 16
        indicatorItem.height: 16
        indicatorItem.color: checked ? QuickColor.HighLight : "white"
        indicatorItem.border.color: "black"

        background: Rectangle {
            color: _delegate.hovered ? Qt.lighter(QuickColor.BackGround, 1.2) : QuickColor.BackGround
        }

        Component.onCompleted: {
            // 更新最大的控件宽
            datasetComboBox.contentItemMaxWidth = Math.max(datasetComboBox.contentItemMaxWidth, width)
            width = Qt.binding(function() { return datasetComboBox.contentItemMaxWidth })
        }
    }

    popup: Popup {
        id: _popup
        y: datasetComboBox.height
        contentItem: ListView {
            implicitWidth: contentWidth
            implicitHeight: contentHeight
            model: datasetComboBox.delegateModel
            currentIndex: datasetComboBox.highlightedIndex
        }
    }

    // 选中的内容的界面显示
    contentItem: Label {
        clip: true
        leftPadding: 5
        width: datasetComboBox.width - indicator.width
        id: displayLabel
        text: datasetComboBox.displayText
        font.pixelSize: fontPixelSize
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
    }
}
