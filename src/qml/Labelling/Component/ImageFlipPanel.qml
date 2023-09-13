import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

Rectangle {
    implicitWidth: 200
    implicitHeight: 200
    color: QuickColor.Primary
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        RowLayout {
            Layout.fillWidth: true
            Layout.margins: 0
            IconImage {
                source: "/icons/image"
                color: palette.brightText
                sourceSize.height: 24
                sourceSize.width: 24
            }

            Label {
                id: imageNameLabel
                text: "很长很长的图像的图像的图像的图像名称"
                clip: true
                font.pixelSize: 16
                Layout.fillWidth: true
                ToolTip {
                    visible: imageNameMouseArea.containsMouse
                    delay: 500
                    text: imageNameLabel.text
                }
                MouseArea {
                    id: imageNameMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                }
            }

            QuickToolButton {
                icon.source: "/icons/delete"
                icon.height: 32
                icon.width: 32
            }
        }

        RowLayout {
            Layout.margins: 0
            Layout.fillWidth: true
            QuickToolButton {
                icon.source: "/icons/left_arrow"
                icon.height: 32
                icon.width: 32
            }

            Label {
                text: "1 / 400"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Layout.fillWidth: true
            }
            QuickToolButton {
                icon.source: "/icons/right_arrow"
                icon.height: 32
                icon.width: 32
            }
        }
    }
}
