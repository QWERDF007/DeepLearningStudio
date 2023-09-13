import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material.impl
import Qt5Compat.GraphicalEffects


CheckBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    padding: 6
    spacing: 6

    property int duration: 83
    property alias colorImage: colorImage
    property alias indicatorItem: _indicator
    property alias indicatorBackground: indicatorBackground
    property alias partiallyCheckedIndicator: partiallyCheckedIndicator
    property alias checkLabel: checkLabel

    // keep in sync with CheckDelegate.qml (shared CheckIndicator.qml was removed for performance reasons)
    indicator: Rectangle {
        id: _indicator
//        property real sizeScale: 1.0
        implicitWidth: Math.min(24, Math.min(control.width, control.height))
        implicitHeight: Math.min(24, Math.min(control.width, control.height))

        radius: 3

        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2

        color: control.down ? control.palette.light : control.palette.base
        border.width: control.visualFocus ? 2 : 1
        border.color: control.visualFocus ? control.palette.highlight : control.palette.mid

        Behavior on color {
            ColorAnimation {
                duration: control.duration
            }
        }

        ColorImage {
            id: colorImage
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: parent.width
            height: parent.height
            defaultColor: "#353637"
            color: control.palette.text
            source: "qrc:/qt-project.org/imports/QtQuick/Controls/Basic/images/check.png"
            visible: control.checkState === Qt.Checked
            Behavior on visible {
                NumberAnimation{
                    duration: control.duration
                }
            }
        }

        Rectangle {
            id: partiallyCheckedIndicator
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: 16
            height: 3
            color: control.palette.text
            visible: control.checkState === Qt.PartiallyChecked
        }
    }

    // 动画, 先缩小然后再放大
    SequentialAnimation {
        id: scaleAnimation
        NumberAnimation { target: _indicator; property: "scale"; to: 0.8; easing.type: Easing.OutCubic; duration: control.duration }
        NumberAnimation { target: _indicator; property: "scale"; to: 1.0; easing.type: Easing.OutCubic; duration: control.duration }
    }

    onCheckStateChanged: {
        scaleAnimation.start()
    }

    // 鼠标悬浮时勾选框的虚化圆形背景
    Rectangle {
        id: indicatorBackground
        anchors.centerIn: _indicator
        implicitHeight: _indicator.implicitHeight * 1.6
        implicitWidth: _indicator.implicitWidth * 1.6
        radius: implicitHeight / 2
        color: _indicator.color
        opacity: 0.3
        visible: control.hovered
        // 波纹效果
        Ripple {
            id: ripple
            clipRadius: 1
            width: parent.width
            height: parent.height
            pressed: control.pressed
            anchor: control
            active: control.down
            color: control.flat && control.highlighted ?  control.Material.highlightedRippleColor : control.Material.rippleColor
            // 圆形按钮时, 波纹效果的透明掩码, 避免超出背景
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle
                {
                    width: ripple.width
                    height: ripple.height
                    radius: indicatorBackground.radius
                }
            }
        }
    }

    contentItem: CheckLabel {
        id: checkLabel
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

        text: control.text
        font: control.font
        color: control.palette.brightText
    }

//    background: Rectangle {
//        anchors.fill: parent
//        color: "red"
//    }
}

