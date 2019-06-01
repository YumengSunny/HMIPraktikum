
import QtQuick 2.12
import QtQuick.Controls 2.12



    ComboBox{

        id: control

        delegate: ItemDelegate {
            width: control.width
            contentItem: Text {
                text: modelData
                color: "purple"
                font: control.font
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter
            }
            highlighted: control.highlightedIndex === index
        }

        font.pixelSize: parent.height*0.4



        contentItem: Text {
                width: parent.width
                height: parent.height

                text: control.displayText
                font: control.font
                color: "purple"
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

        indicator: Canvas {
            id: canvas
            x: control.width - width - control.rightPadding
            y: control.topPadding + (control.availableHeight - height) / 2
            width: 12
            height: 8
            contextType: "2d"

            Connections {
                target: control
                onPressedChanged: canvas.requestPaint()
            }

            onPaint: {
                context.reset();
                context.moveTo(0, 0);
                context.lineTo(width, 0);
                context.lineTo(width / 2, height);
                context.closePath();
                context.fillStyle = control.pressed ? "purple" : "purple";
                context.fill();
            }
        }


    }

