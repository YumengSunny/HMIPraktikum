/*************************************************************************
 *
 * Copyright (c) 2018 Qt Company
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.9
import QtQuick.Window 2.0
import ShapesOriginal 1.0

Window {
    property real margin: 20
    visible: true
    width: 300; height: 200

    Item {
        anchors.fill: parent

        Ellipse {
            anchors { fill: parent; margins: margin }
        }
    }
}
