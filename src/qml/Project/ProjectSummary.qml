import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import dl.studio.theme 1.0

Rectangle {
    id: control
    width: 200
    implicitHeight: Math.max(nameRow.height + sep.height + typeRow.height, 120)

    color: Theme.primary
    property bool editable: true
    property alias projectName: projectLabel.text
    property alias projectType: typeLabel.text
    property alias projectTypeDesc: descLabel.text

    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        Layout.bottomMargin: 5

        // 项目名称
        RowLayout {
            id: nameRow
            Layout.fillWidth: true
            Layout.fillHeight: true
//            Layout.alignment: Qt.AlignTop
            Label {
                id: projectLabel
                Layout.alignment: Qt.AlignLeft
                Layout.fillWidth: true
                Layout.topMargin: 5
                Layout.leftMargin: 5
                text: qsTr("这是项目名称这是项目名称这是项目名称")
                color: Theme.projectDescription
                wrapMode: Text.WordWrap
                font.pixelSize: 18
            }

            ToolButton {
                visible: control.editable
                implicitWidth: 30
                implicitHeight: 30
                icon.source: "/icons/edit"
                ToolTip.visible: hovered
                ToolTip.delay: 500
                ToolTip.text: qsTr("编辑项目名称")
                Layout.alignment: Qt.AlignTop | Qt.AlignRight
                Layout.topMargin: 5
                Layout.rightMargin: 5
            }
        }

        // 分割符
        ToolSeparator {
            id: sep
            orientation: Qt.Horizontal
            Layout.fillWidth: true
        }

        // 项目类型
        RowLayout {
            id: typeRow
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignBottom
            spacing: 5

            Image {
                source: "/icons/object"
                Layout.leftMargin: 5
                Layout.bottomMargin: 5
            }

            ColumnLayout {
                Layout.fillWidth: true
                Layout.bottomMargin: 5
                Label {
                    id: typeLabel
                    Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
                    Layout.fillWidth: true
                    text: qsTr("项目类型")
                    color: "white"
                    wrapMode: Text.WordWrap
                    font.pixelSize: 18
                }
                Label {
                    id: descLabel
                    Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
                    text: qsTr("类型补充描述")
                    color: "white"
                    visible: descLabel.text.length !== 0
                    font.pixelSize: 10
                }
            }

            ToolButton {
                visible: control.editable
                implicitWidth: 30
                implicitHeight: 30
                icon.source: "/icons/kebab"
                Layout.alignment: Qt.AlignRight | Qt.AlignTop
                Layout.rightMargin: 5
                Layout.bottomMargin: 5
            }
        }
    }
}
