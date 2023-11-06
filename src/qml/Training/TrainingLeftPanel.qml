import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./Component"


Item {
    id: root
    width: 400
    height: 600
    TrainingModelPanel {
        anchors.fill: parent
    }
}
