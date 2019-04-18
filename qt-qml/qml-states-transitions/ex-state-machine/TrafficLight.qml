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
    id: root
    color: "black"
    property string currentState: "go"

    Column {
        x: (root.width - childrenRect.width) / 2
        Rectangle {
            width: height
            height: root.height / 3
            radius: width / 2
            color: (currentState === "stop" || currentState == "leavingStop") ? "red" : "black"
        }
        Rectangle {
            width: height
            height: root.height / 3
            radius: width / 2
            color: (currentState === "leavingStop" || currentState === "leavingGo") ? "yellow" : "black"
        }
        Rectangle {
            width: height
            height: root.height / 3
            radius: width / 2
            color: (currentState === "go" || currentState == "") ? "green" : "black"
        }
    }
}
