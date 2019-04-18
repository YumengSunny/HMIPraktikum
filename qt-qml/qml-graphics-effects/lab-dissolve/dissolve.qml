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
    width: picture.width; height: picture.height

    Image {
        id: picture
        anchors.centerIn: parent
        source: "../images/tampere.jpg"
    }

    // Hint: For help you can look at the commented shader
    // code in shader-extract-hint.qml
}
