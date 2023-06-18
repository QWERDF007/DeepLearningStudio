pragma Singleton

import QtQuick
import QtQml

QtObject {
    readonly property int width: 1920
    readonly property int height: 1080

    property string relativeFontDirectory: "fonts"

    /* Edit this comment to add your custom font */
    readonly property font font: Qt.font({
                                             family: Qt.application.font.family,
                                             pixelSize: Qt.application.font.pixelSize
                                         })
    readonly property font largeFont: Qt.font({
                                                  family: Qt.application.font.family,
                                                  pixelSize: Qt.application.font.pixelSize * 1.6
                                              })


    readonly property color backgroundColor: "#303030"
    readonly property color primaryColor: "#3D3D3D"
    readonly property color accentColor: "#353535"
    readonly property color highlightColor: "#009688"
    readonly property color buttonColor: "#009688"
}
