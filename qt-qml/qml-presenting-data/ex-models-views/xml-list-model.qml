/*************************************************************************
 *
 * Copyright (c) 2018 Qt Company
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.9
import QtQuick.XmlListModel 2.0

Rectangle {
    width: 400; height: 260
    color: "#404040"

    XmlListModel {
        id: xmlModel
        source: "files/items.xml"
        query: "//item"

        XmlRole { name: "title"; query: "string()" }
        XmlRole { name: "link"; query: "@link/string()" }
    }

    TitleDelegate {
        id: xmlDelegate
    }

    ListView {
        anchors.fill: parent
        anchors.margins: 4
        model: xmlModel
        delegate: xmlDelegate
    }
}
