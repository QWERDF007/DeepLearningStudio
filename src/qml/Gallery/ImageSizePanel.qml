import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import dl.studio.theme 1.0

import QuickUI

Rectangle {
    width: 400
    height: 400
    color: Theme.primary

    RowLayout {
        anchors.fill: parent
        anchors.margins: 5

        QuickToolButton {
            backgroundVisible: false
            ToolTip.visible: hovered
            ToolTip.delay: 500
            ToolTip.text: qsTr("降低缩率图尺寸 (Ctrl+-)")
            icon.source: "/icons/remove"
            icon.height: 24
            icon.width: 24

            onPressed: {
                imageSizeSlider.decrease()
            }
        }

        QuickSlider {
            id: imageSizeSlider
            from: 0.25
            to: 2.5
            stepSize: 0.25 // 刻度步长
            snapMode: Slider.SnapAlways // 拖动时滑块移到刻度上
            Layout.fillWidth: true
            ToolTip {
                visible: imageSizeSlider.pressed
                text: imageSizeSlider.value
            }
        }

        QuickToolButton {
            backgroundVisible: false
            ToolTip.visible: hovered
            ToolTip.delay: 500
            ToolTip.text: qsTr("增大缩率图尺寸 (Ctrl++)")
            icon.source: "/icons/add"
            icon.height: 24
            icon.width: 24

            onPressed: {
                imageSizeSlider.increase()
            }
        }
    }
}
