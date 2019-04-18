/*************************************************************************
 *
 * Copyright (c) 2018 Qt Company
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.9

Rectangle {
    width: 400; height: 400; color: "black"
    
    Image {
        id: rocket
        anchors.centerIn: parent
        source: "../images/rocket.svg"
        transformOrigin: Item.Center
    }

    Keys.onPressed: {
        if (event.key == Qt.Key_Left)
            rocket.rotation = (rocket.rotation - 10) % 360;
        else if (event.key == Qt.Key_Right)
            rocket.rotation = (rocket.rotation + 10) % 360;
    }
    focus: true
}
