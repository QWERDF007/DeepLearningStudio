import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import dl.studio.theme 1.0

Rectangle {
    id: control
    height: 600
    width: 200
    color: Theme.primary

    property alias projectDesc: projectDescLabel.text
    property alias projectFile: projectFileLabel.text
    property alias imageBasePath: imageBasePathLabel.text
    property alias labelClasses: labelClassesLabel.text
    property string ctime: Qt.formatDateTime(new Date(), "yy-MM-dd")
    property string mtime: Qt.formatDateTime(new Date(), "yy-MM-dd")

    property int iconSize: 28

    ColumnLayout {
        anchors.fill: parent
        ScrollView {
            id: scrollview
            clip: true
            Layout.fillHeight: true
            Layout.fillWidth: true
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical.policy: scrollview.contentHeight > scrollview.height ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff
            ScrollBar.vertical.width: 8


            contentWidth: availableWidth

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 5 // 加边界，避免和滚动条重叠
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
                            implicitWidth: control.iconSize
                            implicitHeight: control.iconSize
                            icon.source: "/icons/edit"
                            ToolTip.visible: hovered
                            ToolTip.delay: 500
                            ToolTip.text: qsTr("编辑项目说明")
                            Layout.alignment: Qt.AlignRight
                        }
                    }


                    Label {
                        id: projectDescLabel
                        Layout.fillWidth: true
                        text: qsTr("这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容
                                这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容
                                这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容
                                这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容
                                这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容
                                这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容
                                这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容
                                这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容
                                这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容
                                这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容
                                这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容
                                这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容这是项目说明详细内容")
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
                        id: projectFileLabel
                        Layout.fillWidth: true
                        text: qsTr("这是项目文件这是项目文件这是项目文件这是项目文件这是项目文件这是项目文件")
                        font.pointSize: 12
                        wrapMode: Text.WordWrap
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true


                    RowLayout {
                        Layout.fillWidth: true
                        Label {
                            Layout.fillWidth: true
                            opacity: 0.5
                            text: qsTr("图像基准路径:")
                            font.pointSize: 12

                        }
                        ToolButton {
                            implicitWidth: control.iconSize
                            implicitHeight: control.iconSize
                            icon.source: "/icons/edit"
                            ToolTip.visible: hovered
                            ToolTip.delay: 500
                            ToolTip.text: qsTr("编辑图像基准路径")
                            Layout.alignment: Qt.AlignRight
                        }
                    }
                    Label {
                        id: imageBasePathLabel
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
                        id: labelClassesLabel
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
                        text: control.ctime + " / " + control.mtime
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
                        id: versionLabel
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
        Button {
            text: qsTr("打开项目")
            font.pointSize: 12
            icon.source: "/icons/close"
            icon.height: iconSize
            icon.width: iconSize
            implicitHeight: 48
            Material.roundedScale: Material.ExtraSmallScale
            Layout.fillWidth: true
            Layout.topMargin: 5
            Layout.bottomMargin: 5
            Layout.leftMargin: 10
            Layout.rightMargin: 10
        }
    }


}
