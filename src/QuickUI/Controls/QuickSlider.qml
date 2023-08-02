import QtQuick
import QtQuick.Controls
//import QtQuick.Controls.impl
//import QtQuick.Templates as T

import QuickUI


Slider {
    id: control
    property color grooveColor: QuickColor.HighLight
    property int grooveWidth: 4
    property int radius: 6

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            handleBackground.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             handleBackground.implicitHeight + topPadding + bottomPadding)
    padding: 6
    handle: Rectangle { // 小圈, 按下变大
        id: _handle
        x: control.leftPadding + (control.horizontal ? control.visualPosition * (control.availableWidth - width) : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : control.visualPosition * (control.availableHeight - height))
        width: 2 * control.radius
        height: 2 * control.radius
        radius: 6
        color: control.grooveColor
        opacity: 1.0
        scale: {
            if(control.pressed){
                return 1.6
            }
            return 1
        }

        Behavior on scale { // 小圈变大动画
            NumberAnimation{
                duration: 200
                easing.type: Easing.OutCubic
            }
        }
    }

    Rectangle { // 大圈, 跟随小圈, 悬浮或者按下时显示
        id: handleBackground
        implicitWidth: 4.8 * control.radius
        implicitHeight: 4.8 * control.radius
        radius: 2.4 * control.radius
        anchors.verticalCenter: _handle.verticalCenter
        anchors.horizontalCenter: _handle.horizontalCenter
        color: Qt.lighter(control.grooveColor, 1.2)
        opacity: 0.2
        visible: control.hovered || control.pressed
    }

    background: Rectangle {
        x: control.leftPadding + (control.horizontal ? 0 : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : 0)
        implicitWidth: control.horizontal ? 200 : control.grooveWidth
        implicitHeight: control.horizontal ? control.grooveWidth : 200
        width: control.horizontal ? control.availableWidth : implicitWidth
        height: control.horizontal ? implicitHeight : control.availableHeight
        radius: 0
        color: Qt.darker(control.grooveColor, 1.5)
        scale: control.horizontal && control.mirrored ? -1 : 1

        Rectangle {
            y: control.horizontal ? 0 : control.visualPosition * parent.height
            width: control.horizontal ? control.position * parent.width : control.grooveWidth
            height: control.horizontal ? control.grooveWidth : control.position * parent.height

            radius: 0
            color: control.grooveColor
        }
    }
}











