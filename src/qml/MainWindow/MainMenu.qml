import QtQuick
import QtQuick.Controls

Menu {
    property var menuModel: [["保存项目", "savePro"], ["项目另存为", "saveAs"], ["导入数据集", "importDataset"],
        ["导出数据集", "exportDataset"], ["关闭项目", "closePro"], ["退出", "quitApplication"]]
    Repeater {
        model: menuModel
        MenuItem {
            text: qsTr(modelData[0])
        }
    }
}

