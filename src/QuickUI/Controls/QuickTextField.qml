import QtQuick
import QtQuick.Controls

import QuickUI
Rectangle {
//Item {
    id: control
    clip: true
    property string placeholderText: qsTr("Enter description")
    property color placeholderTextColor: control.activeFocus ? QuickColor.HighLight : control.palette.dark
    property color cursorColor: QuickColor.HighLight
    property color backgroundColor: QuickColor.BrightButton
    property alias font: text.font
    property alias textColor: text.color
    property alias selectedTextColor: text.selectedTextColor
    property alias selectionColor: text.selectionColor

    property int textLeftMargin: 10
    property int textRightMargin: 10

    radius: 3

    color: control.enabled ? "transparent" : backgroundColor
    border.color: text.activeFocus ? QuickColor.HighLight : QuickColor.BrightButton

    implicitHeight: implicitContentHeight
    implicitWidth: implicitContentWidth



    PlaceholderText {
        clip: true
        visible: !text.length && !text.activeFocus
        anchors.fill: parent
        anchors.leftMargin: textLeftMargin
        anchors.rightMargin: textRightMargin
        text: placeholderText
        font: control.font
        color: control.placeholderTextColor
        verticalAlignment: TextInput.AlignVCenter
    }
    TextInput {
        id: text
        clip: true
        anchors.fill: parent
        anchors.leftMargin: textLeftMargin
        anchors.rightMargin: textRightMargin
        verticalAlignment: TextInput.AlignVCenter

        font.pixelSize: 16
        color: control.palette.base
        selectionColor: QuickColor.HighLight

        cursorDelegate: Rectangle {
            id: cursor
            visible: text.cursorVisible
            color: cursorColor
            width: text.cursorRectangle.width

            SequentialAnimation {
                loops: Animation.Infinite
                running: text.cursorVisible

                PropertyAction {
                    target: cursor
                    property: 'visible'
                    value: true
                }

                PauseAnimation {
                    duration: 500
                }

                PropertyAction {
                    target: cursor
                    property: 'visible'
                    value: false
                }

                PauseAnimation {
                    duration: 500
                }

                onStopped: {
                    cursor.visible = false
                }
            }
        }
    }

//    Rectangle {
//        height: 2
//        color: text.activeFocus ? QuickColor.HighLight : QuickColor.BrightButton
//        width: text.width
//        y: text.height
//        x: text.x
//    }
}

