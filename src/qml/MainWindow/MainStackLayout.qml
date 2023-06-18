import QtQuick.Layouts 1.14
import QtQuick 2.14
import QtQml 2.14

//主界面标签页内容
StackLayout {
    id: pageStackLayout
    //    anchors.fill: parent
    //    currentIndex: 1
//    width: 1920
//    height: 1080
    anchors.fill: parent
    property var tabModel : [
        ["项目", "#3F51B5", "../Project/Project.qml"],
        ["图库","#9FA8DA", "../Gallery/Gallery.qml"],
        ["标注", "#607D8B", "../Labelling/Labelling.qml"],
        ["检查", "#BCAAA4", "../Review/Review.qml"],
        ["训练", "#795548", "../Training/Training.qml"],
        ["评估", "#9E9E9E", "../Evaluation/Evaluation.qml"],
        ["导出", "#607D8B", "../Export/Export.qml"]
    ]
    //代理生成界面
    Repeater {
        model: tabModel
        Rectangle {
            id: container
            Component.onCompleted: {
                console.log("加载tab页：", index, modelData[0], modelData[1], modelData[2])
                var component = Qt.createComponent(modelData[2]);
                console.log("component", component)
                if(component === null) return
                if(component.status === Component.Ready)
                {
                    var object  = component.createObject(container);
                    object.color = modelData[1]
                    object.width = pageStackLayout.width
                }else {
                    console.log("Component.errorString():", component.errorString())
                }
            }
        }
    }

    onCurrentIndexChanged: {
        if(tabModel[currentIndex]) {
            console.log(tabModel[currentIndex][0])
        }
    }

    Component.onCompleted: {

    }
}
