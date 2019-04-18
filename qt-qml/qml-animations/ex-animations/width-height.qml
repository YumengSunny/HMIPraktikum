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
    width: 400; height: 400
    color: "lightblue"

    Rectangle {
        color: "green"
        width: height
        NumberAnimation on height {
            from: 0; to: 400
            duration: 1000
            running: true
        }
    }
}
