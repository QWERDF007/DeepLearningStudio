import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import dl.studio.theme 1.0

ItemDelegate {
    id: root
    width: 200
    height: container.height
    property int borderWidth: 2
    property alias modelName: modelNameLabel.text
    property alias modelType: modelTypeLabel.text
    property alias trainingResult: trainingResultLabel.text
    property alias evalResult: evalResultLabel.text
    property alias contentHeight: content.height
    Column {
        id: container
        width: parent.width
        height: content.height + footer.height

        Rectangle {
            id: content
            width: parent.width

            height: 108
            color: Theme.primary

            Rectangle {
                id: bar
                anchors.top: parent.top
                anchors.topMargin: borderWidth
                width: parent.width
                height: borderWidth
                color: Theme.border
            }

            ColumnLayout {
                width: parent.width
                anchors.left: parent.left
                anchors.top: bar.bottom
                anchors.bottom: parent.bottom
                anchors.leftMargin: 15
                anchors.bottomMargin: borderWidth

                Label {
                    id: modelNameLabel
                    text: qsTr("模型名称")
                    font.pixelSize: 18
                }
                Label {
                    id: trainingResultLabel
                    text: qsTr("训练结果")
                    font.pixelSize: 16
                }

                Label {
                    id: modelTypeLabel
                    text: qsTr("模型架构")
                    font.pixelSize: 16
                }

                Label {
                    id: evalResultLabel
                    text: qsTr("测试结果")
                    font.pixelSize: 16
                }
            }
        }
        Rectangle {
            id: footer
            width: parent.width
            height: 2
            color: Theme.background
        }
    }
}
