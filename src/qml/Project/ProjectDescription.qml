import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import dl.studio.theme 1.0

Rectangle {
    id: projectDesc
    height: 600
    width: 200
    color: Theme.primary

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 5
        spacing: 10
        ColumnLayout {
            Layout.fillWidth: true
            RowLayout {
                Layout.fillWidth: true
                Label {
                    Layout.fillWidth: true
                    opacity: 0.5
                    text: qsTr("项目说明:")
                    font.pointSize: 12

                }
                ToolButton {
                    implicitWidth: 30
                    implicitHeight: 30
                    icon.source: "/icons/edit"
                    ToolTip.visible: hovered
                    ToolTip.delay: 500
                    ToolTip.text: qsTr("编辑项目说明")
                    Layout.alignment: Qt.AlignRight
                }
            }


            Label {
                Layout.fillWidth: true
                text: qsTr("这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容")
                font.pointSize: 12
                wrapMode: Text.WordWrap
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            Label {
                opacity: 0.5
                text: qsTr("项目文件:")
                font.pointSize: 12
            }
            Label {
                Layout.fillWidth: true
                text: qsTr("这是项目文件这是项目文件这是项目文件这是项目文件这是项目文件这是项目文件")
                font.pointSize: 12
                wrapMode: Text.WordWrap
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            Label {
                opacity: 0.5
                text: qsTr("图像基准路径:")
                font.pointSize: 12
            }
            Label {
                Layout.fillWidth: true
                text: qsTr("这是图像基准路径这是图像基准路径这是图像基准路径这是图像基准路径")
                font.pointSize: 12
                wrapMode: Text.WordWrap
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            Label {
                opacity: 0.5
                text: qsTr("标签类别:")
                font.pointSize: 12
            }
            Label {
                Layout.fillWidth: true
                text: qsTr("5: apple, banana, orange, pear, peach, litchi")
                font.pointSize: 12
                wrapMode: Text.WordWrap
            }
        }


        ColumnLayout {
            Layout.fillWidth: true
            Label {
                opacity: 0.5
                text: qsTr("创建时间 / 修改时间:")
                font.pointSize: 12
            }
            Label {
                Layout.fillWidth: true
                text: Qt.formatDateTime(new Date(), "yy-MM-dd") + " / " + Qt.formatDateTime(new Date(), "yy-MM-dd")
                font.pointSize: 12
                wrapMode: Text.WordWrap
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            Label {
                opacity: 0.5
                text: qsTr("程序版本 / 文件版本:")
                font.pointSize: 12
            }
            Label {
                Layout.fillWidth: true
                text: 22.4 + " / " + 1
                font.pointSize: 12
                wrapMode: Text.WordWrap
            }
        }

        // spacer
        Item {
            Layout.fillHeight: true
        }
    }


}
