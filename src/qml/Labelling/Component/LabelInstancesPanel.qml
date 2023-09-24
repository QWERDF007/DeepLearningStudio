import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Qt.labs.qmlmodels

import QuickUI

Rectangle {
    id: labelInstances
    implicitHeight: 200
    implicitWidth: 200
    color: QuickColor.Primary

    readonly property int firstMinColumnWidth: 72
    readonly property int minColumnWidth: 48
    property int tableItemHeight: 24
    property int headerHeight: 24
    property int pixelSize: 12

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 5
        RowLayout {
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            Label {
                text: "标签实例:"
                color: "white"
                font.pixelSize: 16
                Layout.fillWidth: true
                height: parent.height
            }
            QuickToolButton {
                Layout.alignment: Qt.AlignRight
                padding: 4
                backgroundVisible: hovered
                ToolTip.visible: hovered
                ToolTip.delay: 500
                ToolTip.text: qsTr("放大")
                icon.source: "/icons/crossline"
                icon.height: 24
                icon.width: 24
                onPressed: {
                    console.log("点击十字标线")
                }
            }
        }


        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
            HorizontalHeaderView {
                id: horizontalHeader
                implicitHeight: headerHeight
                model: ["类别", "X", "Y", "宽度", "高度"]
                anchors.left: tableView.left
                anchors.top: parent.top
                syncView: tableView
                columnSpacing: 0
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                delegate:  Rectangle {
                    readonly property real cellPadding: 1
                    implicitWidth: text.implicitWidth + (cellPadding * 2)
                    implicitHeight: Math.max(horizontalHeader.height, text.implicitHeight + (cellPadding * 2))
                    //                    implicitHeight: horizontalHeader.implicitHeight
                    color: QuickColor.BackGround
                    Label {
                        id: text
                        anchors.fill: parent
                        anchors.rightMargin: 5
                        font.pixelSize: pixelSize
                        text: horizontalHeader.textRole ?
                                  (Array.isArray(horizontalHeader.model) ? modelData[horizontalHeader.textRole]
                                                                         : model[horizontalHeader.textRole])
                                : modelData
                        horizontalAlignment: index === 0 ? Text.AlignHCenter : Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        color: "white"
                    }
                }
            }


            TableView {
                id: tableView
                anchors.left: parent.left
                anchors.top: horizontalHeader.bottom
                anchors.right: parent.right
                anchors.bottom: parent.bottom

                columnSpacing: 0
                rowSpacing: 0
                boundsBehavior: Flickable.StopAtBounds

                ScrollBar.vertical: ScrollBar {
                    policy: tableView.contentHeight > tableView.height  ? ScrollBar.AlwaysOn  : ScrollBar.AlwaysOff
                }


                columnWidthProvider: function(column) {
                    let minColumnWidth = column === 0 ? labelInstances.firstMinColumnWidth : labelInstances.minColumnWidth
                    let w = explicitColumnWidth(column)
                    if (w >= minColumnWidth)
                        return w;
                    let iw = implicitColumnWidth(column)
                    return iw > minColumnWidth ? iw : minColumnWidth
                }

                clip: true

                model: TableModel {
                    id: tableModel
                    TableModelColumn {
                        display: function(modelIndex) { return tableModel.rows[modelIndex.row].cls }
                        decoration: function(modelIndex) { return tableModel.rows[modelIndex.row].color }
                    }
                    TableModelColumn {
                        display: function(modelIndex) { return tableModel.rows[modelIndex.row].x }
                    }
                    TableModelColumn {
                        display: function(modelIndex) { return tableModel.rows[modelIndex.row].y }
                    }
                    TableModelColumn {
                        display: function(modelIndex) { return tableModel.rows[modelIndex.row].width }
                    }
                    TableModelColumn {
                        display: function(modelIndex) { return tableModel.rows[modelIndex.row].height }
                    }

                    // Each row is one type of fruit that can be ordered
                    rows: [
                        {cls: "dog", x: 125.01, y: 20.50, width: 100.05, height: 1.50, color: "#FFFF00"},
                        {cls: "cat", x: 125.05, y: 10.50, width: 120.05, height: 1.50, color: "#1CE6FF"},
                        {cls: "狗子", x: 1225.01, y: 30.50, width: 11.05, height: 1.50, color: "#FF34FF"},
                        {cls: "菜狗", x: 115.03, y: 200.10, width: 20.45, height: 1.50, color: "#FF4A46"},
                        {cls: "大巴", x: 1725.01, y: 420.05, width: 600.35, height: 1.50, color: "#008941"},
                        {cls: "小车", x: 125.09, y: 202.50, width: 80.45, height: 1.50, color: "#FF4A46"},
                        {cls: "空气", x: 135.55, y: 207.17, width: 20.05, height: 1.50, color: "#008941"},
                        {cls: "鸡蛋", x: 125.48, y: 50.50, width: 400.05, height: 1.50, color: "#A30059"},
                        {cls: "飞机", x: 25.40, y: 200.70, width: 100.01, height: 1.50, color: "#FFDBE5"},
                    ]
                }

                //                selectionBehavior: TableView.SelectRows
                interactive: true
                selectionModel: ItemSelectionModel {}
                property int selectStart: -1

                Keys.onPressed:
                    (event)=> {
                        onKeyPressedHandler(event)
                    }

                delegate:  DelegateChooser {
                    DelegateChoice {
                        column: 0
                        delegate: Rectangle {
                            id: _delegate
                            required property bool selected
                            required property bool current
                            required property var model
                            implicitHeight: tableItemHeight
                            implicitWidth: firstMinColumnWidth
                            color: selected ? QuickColor.HighLight : model.row % 2 === 0 ? Qt.lighter(QuickColor.Primary, 1.3) : QuickColor.Primary
                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 5
                                Rectangle {
                                    implicitHeight: Math.max(tableItemHeight - 8, 8)
                                    implicitWidth: Math.max(tableItemHeight - 8, 8)
                                    color: model.decoration
                                    radius: 2
                                    border.width: 1
                                    Layout.alignment: Qt.AlignVCenter
                                }
                                Label {
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    text: model.display
                                    font.pixelSize: pixelSize
                                    horizontalAlignment: Text.AlignLeft
                                    verticalAlignment: Text.AlignVCenter

                                }
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked:
                                    (mouse)=> {
                                        onMouseClickedHandler(mouse, model)
                                    }
                            }
                        }
                    }
                    // 剩下的列
                    DelegateChoice {
                        delegate: Rectangle{
                            id: _delegate2
                            required property bool selected
                            required property bool current
                            implicitHeight: tableItemHeight
                            implicitWidth: minColumnWidth
                            color: selected ? QuickColor.HighLight : model.row % 2 === 0 ? Qt.lighter(QuickColor.Primary, 1.3) : QuickColor.Primary
                            Label {
                                anchors.fill: parent
                                anchors.rightMargin: 5
                                text: model.display
                                font.pixelSize: pixelSize
                                horizontalAlignment: Text.AlignRight
                                verticalAlignment: Text.AlignVCenter
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked:
                                    (mouse)=> {
                                        console.log("222222")
                                        onMouseClickedHandler(mouse, model)
                                    }
                            }
                        }
                    }
                }

            }
        }
    }

    function onMouseClickedHandler(mouse, model) {
        console.log("mouse click on display", model.display)
        if (!tableView.focus) {
            tableView.forceActiveFocus()
        }
        if (mouse.modifiers === Qt.ControlModifier) {
            if (tableView.selectionModel.isRowSelected(model.row)) {
                tableView.selectionModel.select(tableView.model.index(model.row, 0),
                                                ItemSelectionModel.Rows | ItemSelectionModel.Deselect)
            } else {
                tableView.selectionModel.select(tableView.model.index(model.row, 0),
                                                ItemSelectionModel.Rows | ItemSelectionModel.Select)
            }
            tableView.selectStart = model.row
        } else if (mouse.modifiers === Qt.ShiftModifier) {
            if (tableView.selectStart < 0) {
                return
            }
            tableView.selectionModel.clear()
            let start = Math.min(tableView.selectStart, model.row)
            let end = Math.max(tableView.selectStart, model.row)
            for (var row = start; row <= end; ++row) {
                tableView.selectionModel.select(tableView.model.index(row, 0),
                                                ItemSelectionModel.Rows | ItemSelectionModel.Select)
            }
        } else {
            tableView.selectionModel.select(tableView.model.index(model.row, 0),
                                            ItemSelectionModel.Rows | ItemSelectionModel.ClearAndSelect)
            tableView.selectStart = model.row
        }
    }

    function onKeyPressedHandler(event) {
        console.log("key", event.key, "ControlModifier", event.modifiers & Qt.ControlModifier, "ShiftModifier", event.modifiers & Qt.ShiftModifier)
        if (event.isAutoRepeat) {
            console.log("自动重复触发")
            return
        }
        if (event.modifiers === Qt.ControlModifier && event.key === Qt.Key_A) {
            console.log("ctrl + A")
            for (var row = 0; row <= tableView.rows; ++row) {
                tableView.selectionModel.select(tableView.model.index(row, 0),
                                                ItemSelectionModel.Rows | ItemSelectionModel.Select)
            }
        } else {
            switch (event.key) {
                case Qt.Key_Escape: {
                    tableView.selectionModel.clear()
                    break
                }
                default: {
                    console.log("default")
                }
            }
        }
    }
}
