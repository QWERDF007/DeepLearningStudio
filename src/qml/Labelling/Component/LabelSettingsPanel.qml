import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

Rectangle {
    implicitHeight: 160
    implicitWidth: 200
    color: QuickColor.Primary
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 5
        spacing: 0
        RowLayout {
            Layout.margins: 0
            Layout.fillWidth: true
            implicitHeight: 32
            Label {
                Layout.preferredWidth: 70
                text: "隐藏实例:"
                font.pixelSize: 16
            }

            QuickSwitch {
                implicitHeight: 24
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.margins: 0
            implicitHeight: 32
            spacing: 0
            Label {
                Layout.preferredWidth: 70
                text: "已拟合"
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
            }
            QuickToolButton {
                backgroundVisible: hovered
                ToolTip.visible: hovered
                ToolTip.delay: 500
                ToolTip.text: qsTr("缩小")
                icon.source: "/icons/zoom_out"
                icon.height: 24
                icon.width: 24
                onPressed: {
                    imageSizeSlider.decrease()
                }
            }
            QuickSlider {
                id: imageSizeSlider
                snapMode: Slider.SnapAlways // 拖动时滑块移到刻度上
                Layout.fillWidth: true
            }
            QuickToolButton {
                backgroundVisible: hovered
                ToolTip.visible: hovered
                ToolTip.delay: 500
                ToolTip.text: qsTr("放大")
                icon.source: "/icons/zoom_in"
                icon.height: 24
                icon.width: 24
                onPressed: {
                    imageSizeSlider.increase()
                }
            }
        }
        RowLayout {
            Layout.fillWidth: true
            Layout.margins: 0
            implicitHeight: 32
            spacing: 0
            Label {
                Layout.preferredWidth: 70
                text: "不透明度:"
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
            }
            QuickToolButton {
                backgroundVisible: hovered
                ToolTip.visible: hovered
                ToolTip.delay: 500
                ToolTip.text: qsTr("降低透明度")
                icon.source: "/icons/remove"
                icon.height: 24
                icon.width: 24
                onPressed: {
                    opacitySlider.decrease()
                }
            }
            QuickSlider {
                id: opacitySlider
                snapMode: Slider.SnapAlways // 拖动时滑块移到刻度上
                Layout.fillWidth: true
            }
            QuickToolButton {
                backgroundVisible: hovered
                ToolTip.visible: hovered
                ToolTip.delay: 500
                ToolTip.text: qsTr("增大透明度")
                icon.source: "/icons/add"
                icon.height: 24
                icon.width: 24
                onPressed: {
                    opacitySlider.increase()
                }
            }
        }
        RowLayout {
            Layout.fillWidth: true
            Layout.margins: 0
            implicitHeight: 32
            spacing: 0
            Label {
                Layout.preferredWidth: 70
                text: "亮度:"
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
            }
            QuickToolButton {
                backgroundVisible: hovered
                ToolTip.visible: hovered
                ToolTip.delay: 500
                ToolTip.text: qsTr("降低亮度")
                icon.source: "/icons/remove"
                icon.height: 24
                icon.width: 24
                onPressed: {
                    brightnessSlider.decrease()
                }
            }
            QuickSlider {
                id: brightnessSlider
                snapMode: Slider.SnapAlways // 拖动时滑块移到刻度上
                Layout.fillWidth: true
            }
            QuickToolButton {
                backgroundVisible: hovered
                ToolTip.visible: hovered
                ToolTip.delay: 500
                ToolTip.text: qsTr("增大亮度")
                icon.source: "/icons/add"
                icon.height: 24
                icon.width: 24
                onPressed: {
                    brightnessSlider.increase()
                }
            }
        }
        RowLayout {
            Layout.fillWidth: true
            Layout.margins: 0
            implicitHeight: 32
            spacing: 0
            Label {
                Layout.preferredWidth: 70
                text: "对比度:"
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
            }
            QuickToolButton {
                backgroundVisible: hovered
                ToolTip.visible: hovered
                ToolTip.delay: 500
                ToolTip.text: qsTr("降低对比度")
                icon.source: "/icons/remove"
                icon.height: 24
                icon.width: 24
                onPressed: {
                    contrastSlider.decrease()
                }
            }
            QuickSlider {
                id: contrastSlider
                snapMode: Slider.SnapAlways // 拖动时滑块移到刻度上
                Layout.fillWidth: true
            }
            QuickToolButton {
                backgroundVisible: hovered
                ToolTip.visible: hovered
                ToolTip.delay: 500
                ToolTip.text: qsTr("增大对比度")
                icon.source: "/icons/add"
                icon.height: 24
                icon.width: 24
                onPressed: {
                    contrastSlider.increase()
                }
            }
        }
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
