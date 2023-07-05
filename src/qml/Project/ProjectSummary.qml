import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import dl.studio.theme 1.0

Rectangle {
    id: root
    width: 200
    implicitHeight: Math.max(nameRow.height + sep.height + typeRow.height + padding + padding, 120)

    color: Theme.primary
    property bool editable: true
    property alias projectName: projectNameLabel.text
    property alias projectType: projectTypeLabel.text
    property alias projectTypeDesc: projectTypeDescLabel.text

    property int iconSize: 28
    property int padding: 5

    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        anchors.margins: root.padding

        // 项目名称
        RowLayout {
            id: nameRow
            Layout.fillWidth: true
            Layout.fillHeight: true
//            Layout.alignment: Qt.AlignTop
            Label {
                id: projectNameLabel
                Layout.alignment: Qt.AlignLeft
                Layout.fillWidth: true
                text: qsTr("这是项目名称这是项目名称这是项目名称")
                color: Theme.projectDescription
                wrapMode: Text.WordWrap
                font.pixelSize: 18
            }

            ToolButton {
                visible: root.editable
                implicitWidth: iconSize
                implicitHeight: iconSize
                icon.source: "/icons/edit"
                ToolTip.visible: hovered
                ToolTip.delay: 500
                ToolTip.text: qsTr("编辑项目名称")
                Layout.alignment: Qt.AlignTop | Qt.AlignRight
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
            }

            ColumnLayout {
                Layout.fillWidth: true
                Label {
                    id: projectTypeLabel
                    Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
                    Layout.fillWidth: true
                    text: qsTr("项目类型")
                    color: "white"
                    wrapMode: Text.WordWrap
                    font.pixelSize: 18
                }
                Label {
                    id: projectTypeDescLabel
                    Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
                    text: qsTr("类型补充描述")
                    color: "white"
                    visible: text.length !== 0
                    font.pixelSize: 10
                }
            }

            ToolButton {
                visible: root.editable
                implicitWidth: iconSize
                implicitHeight: iconSize
                icon.source: "/icons/kebab"
                Layout.alignment: Qt.AlignRight | Qt.AlignTop
            }
        }
    }
}
