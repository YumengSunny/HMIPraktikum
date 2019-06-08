import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Private 1.0

import QtQuick.Controls 2.12

Item {

    property string interval:sensorModel.get(0).interval
    property var sensorLight: sensorModel.get(0)
    property var sensorTemp: sensorModel.get(1)
    property var sensorPress: sensorModel.get(2)
    property var sensorHumid: sensorModel.get(3)
    property var sensorAlti: sensorModel.get(4)
    property var sensorGenauArray:[sensorLight.genau,sensorTemp.genau,sensorPress.genau,sensorHumid.genau,sensorAlti.genau]



    height: parent.height
    width: parent.width

    ListModel {
        id: sensorModel
        ListElement {
            sensor: "Light"
            color: "red"
            genau:"2"
            interval:"1"
        }
        ListElement {
            sensor: "Temperature"
            color: "navy"
            genau:"2"
            interval:"1"
        }
        ListElement {
            sensor: "Pressure"
            color: "orange"
            genau:"2"
            interval:"1"
        }
        ListElement {
            sensor: "Humidity"
            color: "seagreen"
            genau:"2"
            interval:"1"
        }
        ListElement {
            sensor: "Altitude"
            color: "purple"
            genau:"2"
            interval:"1"
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
        width: parent.width
        model: sensorModel
        onWidthChanged: {
            column1.width=parent.width*0.2

            column2.width=parent.width*0.2

            column3.width=parent.width*0.2

            column4.width=parent.width*0.2

            column5.width=parent.width*0.2

        }

        headerDelegate: Rectangle{
            color: "purple"
            height: 50
            radius: 8
            Text{
                color: "white"
                anchors.centerIn: parent
                text: styleData.value
                font.pixelSize: parent.height*0.5
            }
            gradient: Gradient{
                        GradientStop { position: 0.0; color: "magenta" }
                        GradientStop { position: 1.0; color: "purple" }
            }
        }


        rowDelegate: Rectangle{
                   height: 50
                   //color: styleData.selected?"blue":transparent
        }

        itemDelegate: Rectangle{
                     //radius:8;
                     height: 100;
                     color : styleData.selected ? "darkgray": "lightgray"
                     Text {
                          anchors.centerIn : parent
                          color : "purple"
                          text: styleData.value

                          font.pixelSize: parent.height*0.4

                      }
                 }



        TableViewColumn {
            id:column1
            role: "sensor"
            title: "Sensor"
            resizable: true


        }
        TableViewColumn {
            id:column2
            role: "color"
            title: "Color"
            resizable:true

            //width: 200
            delegate:Rectangle {
                id:rec1
                width: parent.width
                radius: 8
                color: table1.model.get(styleData.row).color
                //color: colorRec

            }

        }

        TableViewColumn{
            id:column3
            title: "Options"
            role: "color"
            resizable:true
            //background:"purple"
            delegate: Combo{
                id:combo1
                model: colorModel
                displayText: table1.model.get(styleData.row).color
                onActivated: {

                    displayText=currentText;
                    sensorModel.setProperty(styleData.row, "color", displayText);

                }

            }

        }

        TableViewColumn{
            id:column4
            title: "Genauigkeit"
            role:"genau"
            resizable: true
            delegate: Combo{
                anchors.fill: parent
                model:genauModel
                displayText: table1.model.get(styleData.row).genau
                onActivated: {

                    displayText=currentText;
                    sensorModel.setProperty(styleData.row, "genau",displayText);
                }

            }


        }

        TableViewColumn{
            id:column5
            title:"Häufigkeit"
            resizable:true
            role:"interval"
            delegate:Combo{
                model:intervalModel
                displayText: table1.model.get(styleData.row).interval

                onActivated: {

                    displayText=currentText;
                    sensorModel.setProperty(0, "interval", displayText);
                    sensorModel.setProperty(1, "interval", displayText);
                    sensorModel.setProperty(2, "interval", displayText);
                    sensorModel.setProperty(3, "interval", displayText);
                    sensorModel.setProperty(4, "interval", displayText);
                }
            }


        }

    }


}
