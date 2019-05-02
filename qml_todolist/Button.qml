import QtQuick 2.0


Rectangle {
    id: button
    
    SystemPalette { id: palette }
    property alias text: label.text
    property bool pressed: false

    width: 100
    height: 50
    anchors.margins: 12
    color: ma.pressed ? Qt.darker("lightblue") : "lightblue"
    border.color: "black"
    border.width: 1
    radius: 3
    
    signal clicked
    
    Text {
        id: label
        font.pointSize: 12
        anchors.centerIn: parent
    }
    
    MouseArea {
        id: ma
        anchors.fill: parent
        onClicked: button.clicked()
        onPressed: { mouse.accepted = true; button.pressed = true }
    }
}
