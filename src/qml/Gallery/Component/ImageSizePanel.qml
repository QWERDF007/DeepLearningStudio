import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

Rectangle {
    id: imageSizePanel
    width: 400
    height: 400
    color: QuickColor.Primary

    focus: visible

    property alias sizeScaleFrom: imageSizeSlider.from
    property alias sizeScaleValue: imageSizeSlider.value
    property alias sizeScaleTo: imageSizeSlider.to
    property alias sizeScaleStepSize: imageSizeSlider.stepSize

    RowLayout {
        anchors.fill: parent
        anchors.margins: 5

        QuickToolButton {
            backgroundVisible: hovered
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
//            from: 0.5
//            to: 2
//            value: 1.0
//            stepSize: 0.25 // 刻度步长
            snapMode: Slider.SnapAlways // 拖动时滑块移到刻度上
            Layout.fillWidth: true
            ToolTip {
                visible: imageSizeSlider.pressed
                text: imageSizeSlider.value
            }
        }

        QuickToolButton {
            backgroundVisible: hovered
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


    Keys.onPressed: (event)=> {
        console.log("imagesize", event.key)
        if ((event.key === Qt.Key_Plus) && (event.modifiers & Qt.ControlModifier)) {
            imageSizeSlider.increase()
        } else if ((event.key === Qt.Key_Minus) && (event.modifiers & Qt.ControlModifier)) {
            imageSizeSlider.decrease()
        } else {
            event.accept = false
        }
    }
}
