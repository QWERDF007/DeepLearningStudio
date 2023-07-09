import QtQuick
import QtTest

Item {

    Abcd {
        id: myWindow
    }


    TestCase {
        name: "Abcd"

        function test_MyButton() {
            var noClickText = "No Clicked"
            var clickedText = ""
            verify(myWindow.text === noClickText, "text before click should be" + noClickText)
            mouseClick(myWindow.button)
            verify(myWindow.text === noClickText, "text before click should be" + noClickText)
        }
    }
}


