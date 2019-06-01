
import QtQuick 2.9
import QtQuick 2.2
import QtQuick 2.12

import QtQuick.Controls 2.2
import QtQuick.VirtualKeyboard 2.2
import QtCharts 2.3
import QtQuick.Layouts 1.3
import QtGamepad 1.0


ApplicationWindow {
    //property string genau: tableColor.genau
    property string interval: parseInt(tableColor.interval)*1000
    property int m_width: 35
    property int m_space: 35
    //property int m_height: myModel.light
    id: window
    visible: true
    width: 1000
    height: 500
    title: qsTr("Sensordaten Anzeiger ")


    function updateData(){

        myModel.setupModel();
    }

    Gamepad {
        id: gamepad
        deviceId: GamepadManager.connectedGamepads.length > 0 ? GamepadManager.connectedGamepads[0] : -1
        onDeviceIdChanged: GamepadManager.setCancelConfigureButton(deviceId, GamepadManager.ButtonStart);
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {

                Item {
                    id: diagramfield

                    height: parent.height*0.7; width: parent.width / 2;


                    Timer {
                        id:textTimer
                        interval: interval; running: true; repeat: true
                        onTriggered: updateData()
                    }

                    Text{
                        id:headerText
                        text: "Live Data"
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: "Courier"
                        font.bold: true
                        color: "purple"
                        font.pixelSize: 25
                    }


                    Item{

                        anchors.bottom: parent.bottom


                        Rectangle{

                            id:lightSensor
                            anchors.bottom: parent.bottom
                            x:60
                            //y:parent.height*0.8
                            width:m_width
                            height:myModel.light*10
                            color: tableColor.sensorLight.color.toString()
                            border.color: "grey"
                            border.width: 2
                            radius: 10


                        }


                        Text {
                            id:lightValue
                            text: myModel.light
                            color: lightSensor.color
                            font.family: "Courier"
                            font.bold: true
                            font.pixelSize: 8
                            anchors.horizontalCenter:lightSensor.horizontalCenter
                            anchors.bottom: lightSensor.top
                            anchors.bottomMargin: 5
                        }
                        Text {
                            id:lightLabel
                            text: "Light"
                            color: lightSensor.color
                            font.family: "Courier"
                            font.bold: true
                            font.pixelSize: 8
                            anchors.horizontalCenter: lightSensor.horizontalCenter
                            anchors.top: parent.bottom
                            anchors.topMargin: 10
                        }

                    }
                    Item{
                        anchors.bottom: parent.bottom
                        Rectangle{
                            id:tempSensor
                            anchors.bottom: parent.bottom
                            x:m_space+lightSensor.x+m_width
                            //y:parent.height*0.8
                            width:m_width
                            height:myModel.temperature
                            color: tableColor.sensorTemp.color.toString()
                            opacity: 80
                            border.color: "grey"
                            border.width: 2
                            radius: 10


                        }

                        Text {
                            id:tempValue
                            text: myModel.temperature.toFixed(tableColor.sensorTemp.genau)
                            color: tempSensor.color
                            font.family: "Courier"
                            font.bold: true
                            font.pixelSize: 8
                            anchors.horizontalCenter:tempSensor.horizontalCenter
                            anchors.bottom: tempSensor.top
                            anchors.bottomMargin: 5
                        }
                        Text {
                            id:tempLabel
                            text: "Temp"
                            color: tempSensor.color
                            font.family: "Courier"
                            font.bold: true
                            font.pixelSize: 8
                            anchors.horizontalCenter: tempSensor.horizontalCenter
                            anchors.top: parent.bottom
                            anchors.topMargin: 10
                        }

                    }

                    Item{
                        anchors.bottom: parent.bottom
                        Rectangle{
                            id:pressSensor
                            anchors.bottom: parent.bottom
                            x:m_space+tempSensor.x+m_width
                            //y:parent.height*0.8
                            width:m_width
                            height:myModel.pressure/5
                            color: tableColor.sensorPress.color.toString()
                            border.color: "grey"
                            border.width: 2
                            radius: 10


                        }
                        Text {
                            id:pressValue
                            text: myModel.pressure.toFixed(2)
                            color: pressSensor.color
                            font.family: "Courier"
                            font.bold: true
                            font.pixelSize: 8
                            anchors.horizontalCenter:pressSensor.horizontalCenter
                            anchors.bottom: pressSensor.top
                            anchors.bottomMargin: 5
                        }
                        Text {
                            id:pressLabel
                            text: "Pressure"
                            color: pressSensor.color
                            font.family: "Courier"
                            font.bold: true
                            font.pixelSize: 8
                            anchors.horizontalCenter: pressSensor.horizontalCenter
                            anchors.top: parent.bottom
                            anchors.topMargin: 10
                        }
                    }

                    Item{
                        anchors.bottom: parent.bottom
                        Rectangle{
                            id:humidSensor
                            anchors.bottom: parent.bottom
                            x:m_space+pressSensor.x+m_width
                            //y:parent.height*0.8
                            width:m_width
                            height:myModel.humidity
                            color: tableColor.sensorHumid.color.toString()
                            border.color: "grey"
                            border.width: 2
                            radius: 10

                        }
                        Text {
                            id:humidValue
                            text: myModel.humidity.toFixed(2)
                            color: humidSensor.color
                            font.family: "Courier"
                            font.bold: true
                            font.pixelSize: 8
                            anchors.horizontalCenter:humidSensor.horizontalCenter
                            anchors.bottom: humidSensor.top
                            anchors.bottomMargin: 5
                        }
                        Text {
                            id:humidLabel
                            text: "Humidity"
                            color: humidSensor.color
                            font.family: "Courier"
                            font.bold: true
                            font.pixelSize: 8
                            anchors.horizontalCenter: humidSensor.horizontalCenter
                            anchors.top: parent.bottom
                            anchors.topMargin: 10
                        }

                    }
                    Item{
                        anchors.bottom: parent.bottom
                        Rectangle{
                            id:altiSensor
                            anchors.bottom: parent.bottom
                            x:m_space+humidSensor.x+m_width
                            //y:parent.height*0.8
                            width:m_width
                            height:myModel.altitude
                            color: tableColor.sensorAlti.color.toString()
                            border.color: "grey"
                            border.width: 2
                            radius: 10

                        }

                        Text {
                            id:altiValue
                            text: myModel.altitude.toFixed(2)
                            color: altiSensor.color
                            font.family: "Courier"
                            font.bold: true
                            font.pixelSize: 8
                            anchors.horizontalCenter:altiSensor.horizontalCenter
                            anchors.bottom: altiSensor.top
                            anchors.bottomMargin: 5
                        }
                        Text {
                            id:altiLabel
                            text: "Altitude"
                            color: altiSensor.color
                            font.family: "Courier"
                            font.bold: true
                            font.pixelSize: 8
                            anchors.horizontalCenter: altiSensor.horizontalCenter
                            anchors.top: parent.bottom
                            anchors.topMargin: 10
                        }
                    }

                }

                Button{
                    anchors.top: diagramfield.bottom
                    anchors.topMargin: 45
                    anchors.horizontalCenter: diagramfield.horizontalCenter


                    onClicked: {
                        myModel.isBlocked?myModel.unblockSignal():myModel.blockSignal();

                    }


                    //text:readData.isBlocked?"Start":"Stop"

                    text:if(gamepad.buttonA){
                             myModel.isBlocked?myModel.unblockSignal():myModel.blockSignal();
                             myModel.isBlocked?"Start":"Stop";
                          }else{
                             myModel.isBlocked?"Start":"Stop";
                         }


                }

                Item{

                    id:liste
                    anchors.right: parent.right
                    height: parent.height; width: parent.width / 2;


                    Table1{
                        id:history
                        x: diagramfield.width;
                        model: myModel
                        anchors.fill: parent
                        itemDelegate: Rectangle{
                             //radius:8;

                          color : styleData.selected ? "darkgray": "lightgray"
                          Text {
                              anchors.centerIn : parent
                              color : "purple"
                              text: styleData.value.toFixed(tableColor.sensorGenauArray[styleData.column])

                              font.pixelSize: parent.height*0.4

                           }
                        }
                    }

                }
        }

        Page2Form {
            Table{
                anchors.top: parent.top
                anchors.topMargin: 50
                id:tableColor

            }

            Text{
                id:headerSetting
                anchors.bottom: tableColor.top
                anchors.bottomMargin: 35
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Settings"
                color: "purple"
                font.family: "Courier"
                font.bold: true
                font.pixelSize: 30

            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Live Data")


        }
        TabButton {
            text: qsTr("Setting")

        }
    }

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}


