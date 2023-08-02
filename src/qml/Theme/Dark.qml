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


    readonly property color background: "#303030"
    readonly property color primary: "#3D3D3D"
    readonly property color accent: "#353535"
    readonly property color highlight: "#009688"
    readonly property color projectDescription: "#009688"
    readonly property color border: "#434343"
//    readonly property color button: "#646464"

    readonly property QtObject tabButton: QtObject {
        readonly property color background: "#303030"
        readonly property color primary: "#484848"
        readonly property color highlight: "#009688"
        readonly property color down: "#6A6A6A"
    }


    readonly property QtObject button: QtObject {
        readonly property color background: "#595959"
        readonly property color highlight: "#009688"
    }

}
