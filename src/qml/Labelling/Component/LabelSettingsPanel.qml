import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

Rectangle {
    id: labelSettingsPanel
    implicitHeight: 160
    implicitWidth: 200
    color: QuickColor.Primary
    property int contentHeight: 32
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 5
        spacing: 0
        Label {
            Layout.alignment: Qt.AlignLeft
            text: "图像设置:"
            font.pixelSize: 16
        }

        RowLayout {
            Layout.margins: 0
            Layout.fillWidth: true
            Layout.topMargin: 10
            height: labelSettingsPanel.contentHeight
            Label {
                Layout.preferredWidth: 70
                text: "隐藏实例:"
                font.pixelSize: 16
            }

            QuickSwitch {
                padding: 0
                implicitHeight: 20
                ToolTip.visible: hovered
                ToolTip.delay: 500
                ToolTip.text: checked ? qsTr("显示标注实例") : qsTr("隐藏标注实例")
            }
            Item {
                Layout.fillWidth: true
            }

            QuickToolButton {
                Layout.alignment: Qt.AlignRight
                padding: 4
                backgroundVisible: hovered
                ToolTip.visible: hovered
                ToolTip.delay: 500
                ToolTip.text: qsTr("将图像与屏幕相适应")
                icon.source: "/icons/aspect_ratio"
                icon.height: 24
                icon.width: 24
                onPressed: {
                }
            }
        }

        ListView {
            Layout.fillWidth: true
            implicitHeight: contentItem.childrenRect.height // 高度由子组件决定
//            Layout.fillHeight: true

            model: ListModel {
                ListElement {text: "已拟合"; value: 1.0; from: 0.25; to: 32; stepSize: 0.1; tooltip: "%1-图像缩放"}
                ListElement {text: "不透明度:"; value: 0; from: 0; to: 100; stepSize: 1; tooltip: "%1\%-显示在图像上的标签区域的不透明度"}
                ListElement {text: "亮度:"; value: 0; from: -100; to: 100; stepSize: 1; tooltip: "%1\%-图像亮度"}
                ListElement {text: "对比度:"; value: 0; from: 0; to: 100; stepSize: 1; tooltip: "%1%\%-图像对比度"}
            }

            delegate: RowLayout {
                Layout.fillWidth: true
                Layout.margins: 0
                height: labelSettingsPanel.contentHeight
                spacing: 0
                Label {
                    Layout.preferredWidth: 70
                    text: model.text
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                }

                QuickSlider {
                    id: _slider
                    from: model.from
                    to: model.to
                    value: model.value
                    stepSize: model.stepSize
                    snapMode: Slider.SnapAlways // 拖动时滑块移到刻度上
                    Layout.fillWidth: true
                    ToolTip {
                        visible: _slider.pressed | _slider.hovered
                        delay: 500
                        text: model.tooltip.arg(_slider.value)
                    }
                }
            }
        }
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
