import QtQuick
import QtQuick.Controls

Window {
    property alias text: myText.text
    property alias button: myButton

    width: 200
    height: 300

    Text {
        id: myText
        text: "No Click"
    }

    Button {
        id: myButton
        onClicked: {
            myText.text = "Clicked"
        }
    }
}
