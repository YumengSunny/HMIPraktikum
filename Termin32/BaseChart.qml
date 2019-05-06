import QtQuick 2.9
import QtCharts 2.3

ChartView{
    id: chart

    titleFont.styleName: "SemiBold"
    titleColor: "magenta"
    legend.alignment: Qt.AlignBottom

    legend.labelColor: "white"
    antialiasing: true
    backgroundColor: "transparent"

    ValueAxis {
           id: valueAxis
           min: 0
           max: 30

    }
}
