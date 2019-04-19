import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.VirtualKeyboard 2.2
import QtQuick.Controls 2.0
import QtGamepad 1.0

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Gamepad {
        id: gamepad
        deviceId: GamepadManager.connectedGamepads.length > 0 ? GamepadManager.connectedGamepads[0] : -1
        onDeviceIdChanged: GamepadManager.setCancelConfigureButton(deviceId, GamepadManager.ButtonStart);
    }

    Rectangle{
        width:parent.width
        height: parent.height
        color: "lightblue"
        id: rectangle1
        Text {
            id:data
            font.family: "Helvetica"
            font.pointSize: 24
            text: "Light: " +readData.lightValue+ ",\n"
                     + "Temperature: "+readData.temperature.toFixed(2)+",\n"
                     +"Humidity: "+readData.humidity.toFixed(2)+",\n"
                     +"Pressure: "+readData.pressure.toFixed(2)+",\n"
                     +"Altitude: "+readData.altitude.toFixed(2)

            anchors.centerIn: rectangle1

         }



        Button{
            x:parent.width*0.4;
            y:parent.height*0.8

            onClicked: {
                readData.isBlocked?readData.unblockSignal():readData.blockSignal();

            }


            //text:readData.isBlocked?"Start":"Stop"

            text:if(gamepad.buttonA){
                     readData.isBlocked?readData.unblockSignal():readData.blockSignal();
                     readData.isBlocked?"Start":"Stop";
                  }else{
                     readData.isBlocked?"Start":"Stop";
                 }


        }



        Connections {
            target: GamepadManager
            onGamepadConnected: gamepad.deviceId = deviceId
        }




    }



   /* InputPanel {
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
    }*/
}
