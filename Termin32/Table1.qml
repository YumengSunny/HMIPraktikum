import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Private 1.0

import QtQuick.Controls 2.12



    TableView {
        id:table1
        anchors.left: parent.left
        height: parent.height
        width: parent.width

        onWidthChanged: {
            column1.width=parent.width*0.2

            column2.width=parent.width*0.2

            column3.width=parent.width*0.2

            column4.width=parent.width*0.2

            column5.width=parent.width*0.2

        }

        headerDelegate: Rectangle{
            color: "purple"
            height: 30
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
                   height: 30
                   //color: styleData.selected?"blue":transparent
        }

        TableViewColumn {
            id:column1
            role: "light"
            title: "Light"
            resizable: true


        }
        TableViewColumn {
            id:column2
            role: "temperature"
            title: "Temp"
            resizable:true

        }

        TableViewColumn{
            id:column3
            title: "Humidity"
            role: "humidity"
            resizable:true

        }

        TableViewColumn{
            id:column4
            title: "Pressure"
            role:"pressure"
            resizable: true

        }

        TableViewColumn{
            id:column5
            title:"Altitude"
            resizable:true
            role:"altitude"


        }

    }



