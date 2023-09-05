import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material.impl
import Qt5Compat.GraphicalEffects

//import dl.studio.theme 1.0

import QuickUI


Button {
    id: control
    property color backgroundColor: QuickColor.DarkButton
    property int radius: 2
    property bool backgroundVisible: true
    property alias popupContentItem: popupMenu.contentItem

    property alias dropDownButton: dropDownBtn
    property alias popupMenu: popupMenu

    implicitWidth: implicitContentWidth/* + leftPadding + rightPadding*/
    implicitHeight: implicitContentHeight/* + topPadding + bottomPadding*/

    //    padding: 0
    leftPadding: 0
    rightPadding: 0
    topPadding: 0
    bottomPadding: 0

    icon.color: control.palette.brightText
    spacing: 6

    checkable: true

    contentItem: RowLayout {
        id: container
        //        clip: true
        anchors.centerIn: parent
        opacity: enabled ? 1.0 : 0.3
        QuickToolButton {
            id: dropDownBtn
            icon.source: "/icons/expand"
            padding: 4
            implicitWidth: 20
            implicitHeight: 20
            Layout.leftMargin: 5
            Layout.alignment: Qt.AlignHCenter
            backgroundColor: Qt.lighter(bg.color, 1.1)
            backgroundVisible: hovered

            onClicked: {
                if (!popupMenu.visible) {
                    popupMenu.open()
                } else {
                    popupMenu.close()
                }
            }


            Popup {
                id: popupMenu
                y: container.y + container.height
//                height: popupMenu.contentItem.childrenRect.height
//                width: popupMenu.contentItem.childrenRect.width
                contentWidth:  popupMenu.contentItem.implicitWidth
                contentHeight:  popupMenu.contentItem.implicitHeight
                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

                Component.onCompleted: {
                    console.log("123", popupMenu.width, popupMenu.height)
                }
            }
        }

        Text {
            text: control.text
            font: control.font
            opacity: enabled ? 1.0 : 0.3
            color: control.palette.brightText
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            Layout.rightMargin: 5
        }
    }

    background: Rectangle {
        id: bg
        anchors.centerIn: parent
        width: control.implicitWidth
        height: control.implicitHeight
        radius: control.radius
        clip: true
        color: control.checked ? QuickColor.HighLight : Qt.lighter(control.backgroundColor, control.hovered ? 1.2 : 1.0)
        opacity: enabled ? 1 : 0.3
        visible: control.backgroundVisible

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
                    radius: control.radius
                }
            }
        }
    }
}
