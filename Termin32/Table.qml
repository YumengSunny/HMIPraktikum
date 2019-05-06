import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.5

Item {
    property string genau:"2"
    property string interval: "1000"
    property color lightColor: sensorModel.get(0).color
    property color tempColor: sensorModel.get(1).color
    property color pressColor: sensorModel.get(2).color
    property color humidColor: sensorModel.get(3).color
    property color altiColor: sensorModel.get(4).color

    height: parent.height
    width: parent.width
    ListModel {
        id: sensorModel
        ListElement {
            sensor: "Light"
            color: "red"
        }
        ListElement {
            sensor: "Temperature"
            color: "navy"
        }
        ListElement {
            sensor: "Pressure"
            color: "orange"
        }
        ListElement {
            sensor: "Humidity"
            color: "seagreen"
        }
        ListElement {
            sensor: "Altitude"
            color: "purple"
        }
    }

    ListModel{
        id:colorModel
        ListElement { text: "red" }
        ListElement { text: "navy" }
        ListElement { text: "orange" }
        ListElement { text: "seagreen" }
        ListElement { text: "purple" }
    }

    ListModel{
        id:genauModel
        ListElement { text: "2" }
        ListElement { text: "0" }
        ListElement { text: "1" }

        ListElement { text: "3" }
        ListElement { text: "4" }
        ListElement { text: "5" }
    }

    ListModel{
        id:intervalModel
        ListElement { text: "1" }
        ListElement { text: "2" }
        ListElement { text: "3" }
        ListElement { text: "4" }
        ListElement { text: "5" }

    }




    TableView {
        id:table1
        anchors.left: parent.left
        height: parent.height
        width: parent.width*0.6
        model: sensorModel
        TableViewColumn {
            id:column1
            role: "sensor"
            title: "Sensor"

        }
        TableViewColumn {
            id:column2
            role: "color"
            title: "Color"

            //width: 200
            delegate:Rectangle {
                id:rec1
                width: parent.width
                color: table1.model.get(styleData.row).color
                //color: colorRec

            }

        }

        TableViewColumn{
            id:column3
            title: "Options"
            role: "color"
            delegate: ComboBox{
                model:colorModel
                displayText: table1.model.get(styleData.row).color

                onActivated: {

                    displayText=currentText;
                    sensorModel.setProperty(styleData.row, "color", displayText);

                }

            }
        }

    }

    TableView{
        id:table2
        anchors.right: parent.right
        height:parent.height
        width:parent.width*0.4
        model:ListModel{
            ListElement{text:"1"}
        }
        TableViewColumn{
            id:column4
            title: "Genauigkeit"

            delegate: ComboBox{
                anchors.fill: parent
                model:genauModel
                onActivated: genau=currentText

            }

        }

        TableViewColumn{
            id:column5
            title:"Häufigkeit"
            delegate:ComboBox{
                model:intervalModel
                onActivated: interval=currentText
            }
        }
    }
}
