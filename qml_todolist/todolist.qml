import QtQuick 2.0

Rectangle {
    id: root
    width: 420
    height: 680

    color: "cornsilk"

    ListModel {
        id: todoModel

        ListElement {
            todo: "Buy coffee"
            date: "15.07.2013"
            done: false
        }
        ListElement {
            todo: "Learn QML"
            date: "15.07.2013"
            done: true
        }
        ListElement {
            todo: "Save World"
            date: "15.07.2013"
            done: false
        }
    }

    Component {
        id: todoDelegate

        Rectangle {
            id: todoItem
            width: parent.width
            height: 90
            color: "transparent"
            radius: 6
            border.color: "lightsteelblue"
            border.width: 2

            property bool showDeleteButton: false

            Button {
                id: doButton
                text: done ? "Undo" : "Done!"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    todoModel.get(index).done = !todoModel.get(index).done;
                }
            }

            Item {
                id: todoInformation
                anchors.left: doButton.right
                anchors.right: deleteButton.left
                anchors.leftMargin: 12
                anchors.verticalCenter: parent.verticalCenter
                opacity: done ? 0.6  : 1.0
                height: parent.height

                Text {
                    id: todoText
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.margins: 4
                    font.pointSize: 12
                    text: todo
                    font.strikeout: done
                }

                Text {
                    id: dateText
                    anchors.top: todoText.bottom
                    anchors.left: parent.left
                    anchors.margins: 4
                    font.pointSize: 10
                    text: date
                    font.strikeout: done
                }
            }

            Rectangle {
                id: deleteButton
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 12
                width: 26
                height: 26
                radius: 14
                color: "#838383"
                
                Text {
                    anchors.fill: parent
                    anchors.leftMargin: 2.5
                    anchors.topMargin: -18
                    font.pointSize: 16
                    color: "cornsilk"
                    text: "x"
                }

                opacity: showDeleteButton ? 1.0 : 0.0
                Behavior on opacity {
                    NumberAnimation {duration: 450 }
                }
            }

            MouseArea {
                id: hoverArea
                anchors.left: doButton.right
                anchors.right: parent.right
                height: parent.height
                hoverEnabled: true
                onEntered: parent.showDeleteButton = true
                onExited: parent.showDeleteButton  = false
                onClicked: {
                    var m = mapToItem(parent, mouse.x, mouse.y);
                    if (       m.x > deleteButton.x && m.x < (deleteButton.x + deleteButton.width)
                          &&   m.y > deleteButton.y && m.y < (deleteButton.y + deleteButton.height)) {
                        // mouse clicked inside delete button area, so delete this item
                        todoModel.remove(index);
                    }
                }
            }
        }
    }


    ListView {
        id: todoList
        anchors.top: parent.top
        anchors.bottom: addBar.top
        anchors.left: parent.left
        anchors.right: parent.right

        anchors.margins: 12
        spacing: 12
        model: todoModel
        delegate: todoDelegate

        remove: Transition {
            NumberAnimation { properties: "opacity"; to: 0.0; duration: 350 }
        }
        removeDisplaced: Transition {
            NumberAnimation { properties: "y"; duration: 350 }
        }
    }

    Item {
        id: addBar
        width: parent.width
        height: 65
        anchors.bottom: parent.bottom
        
        function addEntry() {
            var newEntry = {
                todo: addTextContainer.inputText,
                date: Qt.formatDateTime(new Date(), "dd.MM.yyyy"),
                done: false
            };
            todoModel.append(newEntry);
            addTextContainer.inputText = "";
        }

        Rectangle {
            id: addTextContainer
            anchors.left: parent.left
            anchors.right: addButton.left
            anchors.bottom: parent.bottom

            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 6
            width: parent.width - addButton.width - 2 * anchors.margins
            height: parent.height

            color: "white"
            border.color: "black"
            border.width: 2
            radius: 6

            property alias inputText: addText.text

            TextInput {
                id: addText
                anchors.fill: parent
                anchors.margins: 6
                font.pointSize: 12
                onAccepted: addBar.addEntry()
            }
        }

        Button {
            id: addButton
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 12
            text: "Add"
            onClicked: addBar.addEntry()
        }
    }

}
