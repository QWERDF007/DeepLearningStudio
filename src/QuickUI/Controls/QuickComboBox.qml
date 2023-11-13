import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QuickUI

ComboBox {
    id: control
    popup: Popup {
        id: _popup
        y: control.height
        contentItem: ListView {
            implicitWidth: contentItem.childrenRect.width // 以子组件最大宽度作为弹窗的宽度
            implicitHeight: contentHeight
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex
            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }
}
