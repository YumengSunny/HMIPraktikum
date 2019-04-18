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

    Grid {
        rows: 5; columns: 5; spacing: 10
        Repeater {
            model: 24
            Image {
                source: "../images/rocket.png"
            }
        }
    }
}
