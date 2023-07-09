import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
//import QtQuick.Window

Item {
    property string headerText: "Titlte"
    property bool expand: true
    property bool init: true
    property int contentHeight : height - layout_header.height
    property int duration: 500
    default property alias content: container.data
    id:control
    implicitHeight: Math.max((layout_header.height + container.height),layout_header.height)
    implicitWidth: 400
    Item {
        id:layout_header
        width: parent.width
        height: 45
        RowLayout {
            width: parent.width
            ToolButton {
                id: toolBtn
                icon.source: "/icons/collaps"
                icon.height: 10
                icon.width: 8
                Layout.alignment: Qt.AlignLeft
                rotation: expand ? 90 : 0
                implicitHeight: 28
                implicitWidth: 28
                onClicked: {
                    expand = !expand
                    init = false
                }
                Behavior on rotation {
                    NumberAnimation{ duration: control.duration; easing.type: Easing.OutCubic }
                }
            }
            Label {
                text: headerText
                Layout.alignment: Qt.AlignLeft
                Layout.fillWidth: true
            }
        }
    }
    Item{
        anchors{
            top: layout_header.bottom
            topMargin: -1
            left: layout_header.left
        }
        width: parent.width
        clip: true
        visible: control.init && !control.expand ? false :  contentHeight+container.y !== 0
        height: contentHeight+container.y
        Item {
            id:container
            width: parent.width
            height: parent.height
            y: -contentHeight
            states: [
                State{
                    name:"expand"
                    when: control.expand
                    PropertyChanges { target: container; y:0 }
                },
                State{
                    name:"collapsed"
                    when: !control.expand
                    PropertyChanges { target: container; y:-contentHeight }
                }
            ]
            transitions: [
                Transition {
                    to:"expand"
                    NumberAnimation { properties: "y"; duration: control.duration; easing.type: Easing.OutCubic }
                },
                Transition {
                    to:"collapsed"
                    NumberAnimation { properties: "y"; duration: control.duration; easing.type: Easing.OutCubic }
                }
            ]
        }
    }
}
