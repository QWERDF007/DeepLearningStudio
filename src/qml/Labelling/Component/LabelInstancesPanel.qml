import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Qt.labs.qmlmodels

import QuickUI

Rectangle {
    implicitHeight: 200
    implicitWidth: 200
    color: QuickColor.Primary

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
                columnSpacing: 1
                rowSpacing: 1
                boundsBehavior: Flickable.StopAtBounds
                resizableColumns: true

                columnWidthProvider: function(column) {
                    let w = explicitColumnWidth(column)
                    if (w >= 0)
                        return w;
                    return implicitColumnWidth(column)
                }

                clip: true

                model: TableModel {
                    TableModelColumn { display: "checked" }
                    TableModelColumn { display: "amount" }
                    TableModelColumn { display: "fruitType" }
                    TableModelColumn { display: "fruitName" }
                    TableModelColumn { display: "fruitPrice" }

                    // Each row is one type of fruit that can be ordered
                    rows: [
                        {
                            // Each property is one cell/column.
                            checked: false,
                            amount: 1,
                            fruitType: "Apple",
                            fruitName: "Granny Smith",
                            fruitPrice: 1.50
                        },
                        {
                            checked: true,
                            amount: 4,
                            fruitType: "Orange",
                            fruitName: "Navel",
                            fruitPrice: 2.50
                        },
                        {
                            checked: false,
                            amount: 1,
                            fruitType: "Banana",
                            fruitName: "Cavendish",
                            fruitPrice: 3.50
                        }
                    ]
                }
                delegate: DelegateChooser {
                    DelegateChoice {
                        column: 0
                        delegate: Rectangle {
                            implicitHeight: 48
                            implicitWidth: 80
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
                        delegate: TextField {
                            text: model.display
                            selectByMouse: true
                            implicitWidth: 48
                            onAccepted: model.display = text
                        }
                    }
                }
            }
        }
    }
}
