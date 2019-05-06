import QtQuick 2.9
import QtQuick 2.2
import QtQuick 2.12

import QtQuick.Controls 2.2
import QtQuick.VirtualKeyboard 2.2
import QtCharts 2.3
import QtQuick.Layouts 1.3


ApplicationWindow {
    property string genau: tableColor.genau
    property string interval: parseInt(tableColor.interval)*1000
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")

    function updateData(){

        //mySeries.clear();


        var valueBar=[0,0,0,0,0];
        for(var i=0; i<5;i++){
            valueBar[i]=(Math.random()*30).toFixed(parseInt(genau));
            mySeries.at(i).values=[valueBar[i]];

        }

        //mySeries.append("Sensorvalue",valueBar);
        //mySeries.at(0).color="magenta";

        history.model.append({textvalue: Date()});
        history.model.append({textvalue: '<b>Light:</b> ' + valueBar[0]});
        history.model.append({textvalue: '<b>Temperature:</b>'  + valueBar[1]});
        history.model.append({textvalue: '<b>Humidity:</b> ' + valueBar[2]});
        history.model.append({textvalue: '<b>Pressure:</b> ' + valueBar[3]});
        history.model.append({textvalue: '<b>Altitude:</b> ' + valueBar[4]+ "<br>"});


    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {

                Item {
                    id: diagramfield

                    height: parent.height; width: parent.width / 2;

                    Timer {
                        id:textTimer
                        interval: interval; running: true; repeat: true
                        onTriggered: updateData()
                    }
                    //![1]
                    BaseChart {
                        title: "Live Data"
                        anchors.fill: parent
                        BarSeries {
                            id: mySeries
                            axisY: ValueAxis{
                                max: 40
                            }

                            axisX: BarCategoryAxis { categories: ["Value"] }


                            BarSet { label: "Light"; color: tableColor.lightColor.toString()}
                            BarSet { label: "Temperature"; color: tableColor.tempColor.toString()}
                            BarSet { label: "Pressure"; color: tableColor.pressColor.toString()}
                            BarSet { label: "Humidity"; color: tableColor.humidColor.toString()}
                            BarSet { label: "Altitude"; color: tableColor.altiColor.toString()}


                        }


                    }

                    Button {
                        id: startStop

                        text: "Start/Stop"

                        onClicked: {
                            if(textTimer.running){
                            textTimer.stop()
                            }else{textTimer.start();}
                        }
                    }
                    //![1]
                }

                Item{

                    id:liste
                    anchors.right: parent.right
                    height: parent.height; width: parent.width / 2;


                    ListView{
                        id:history
                        x: diagramfield.width;

                        anchors.fill: parent
                        model: ListModel{}
                        spacing: 5
                        delegate: Text {

                            text: textvalue
                        }

                        header: Rectangle {
                            width: parent.width; height: 30;
                            color: "purple"
                            Text {

                                text: qsTr("History")
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }

                    }


                }




        }

        Page2Form {
            Table{
                id:tableColor

            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page 1")


        }
        TabButton {
            text: qsTr("Page 2")

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
