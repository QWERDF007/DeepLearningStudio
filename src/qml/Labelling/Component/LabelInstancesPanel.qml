import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Qt.labs.qmlmodels

//import QuickUI

Rectangle {
    implicitHeight: 200
    implicitWidth: 200
    //    color: QuickColor.Primary
    color: "#3D3D3D"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 5
        RowLayout {
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            Label {
                text: "标签实例:"
                color: "white"
                Layout.fillWidth: true
            }
            Button {
                text: "十字标线"
                Layout.alignment: Qt.AlignRight
            }
        }


        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
            HorizontalHeaderView {
                id: horizontalHeader
                model: ["类别", "x", "y", "宽度", "高度"]
                anchors.left: tableView.left
                anchors.top: parent.top
                syncView: tableView
                columnSpacing: 0
                clip: true
            }
            VerticalHeaderView {
                id: verticalHeader
                property alias hoverHandler: hoverHandler
                anchors.top: tableView.top
                anchors.left: parent.left
                syncView: tableView
                clip: true
                HoverHandler {id: hoverHandler }
            }

            TableView {
                id: tableView
                anchors.left: verticalHeader.right
                anchors.top: horizontalHeader.bottom
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                columnSpacing: 0
                rowSpacing: 1
                boundsBehavior: Flickable.StopAtBounds
                resizableColumns: true
                property int minColumnWidth: 48

                columnWidthProvider: function(column) {
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
                        background: function(modelIndex) { return tableModel.rows[modelIndex.row].background }
                    }
                    TableModelColumn {
                        display: function(modelIndex) { return tableModel.rows[modelIndex.row].x }
                        background: function(modelIndex) { return tableModel.rows[modelIndex.row].background }
                    }
                    TableModelColumn {
                        display: function(modelIndex) { return tableModel.rows[modelIndex.row].y }
                        background: function(modelIndex) { return tableModel.rows[modelIndex.row].background }
                    }
                    TableModelColumn {
                        display: function(modelIndex) { return tableModel.rows[modelIndex.row].width }
                        background: function(modelIndex) { return tableModel.rows[modelIndex.row].background }
                    }
                    TableModelColumn {
                        display: function(modelIndex) { return tableModel.rows[modelIndex.row].height }
                        background: function(modelIndex) { return tableModel.rows[modelIndex.row].background }
                    }

                    // Each row is one type of fruit that can be ordered
                    rows: [
                        {cls: "dog", x: 125.01, y: 20.50, width: 100.05, height: 1.50, color: "red", background: "#3D3D3D"},
                        {cls: "cat", x: 125.01, y: 20.50, width: 100.05, height: 1.50, color: "yellow", background: "#5E5E5E"},
                    ]
                }
                delegate: DelegateChooser {
                    DelegateChoice {
                        column: 0
                        delegate: Rectangle {
                            implicitHeight: 48
                            implicitWidth: 80
                            color: model.background
                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 5
                                Rectangle {
                                    implicitHeight: 24
                                    implicitWidth: 24
                                    color: model.decoration
                                    radius: 2
                                    border.width: 1
                                }
                                Label {
                                    text: model.display
                                    Layout.fillWidth: true
                                }
                            }
                        }
                    }

                    //                    DelegateChoice {
                    //                        delegate: SpinBox {
                    //                            value: model.display
                    //                            onValueModified: model.display = value
                    //                        }
                    //                    }
                    // 剩下的列
                    DelegateChoice {
                        delegate: Rectangle{
                            implicitWidth: 48
                            color: model.background
                            Label {
                                anchors.fill: parent
                                text: model.display
                                horizontalAlignment: Text.AlignRight
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }
                }
            }
        }
    }
}
