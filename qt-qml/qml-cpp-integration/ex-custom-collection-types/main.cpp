/*************************************************************************
 *
 * Copyright (c) 2018 Qt Company
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "baritem.h"
#include "chartitem.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<ChartItem>("ShapesOriginal", 8, 0, "Chart");
    qmlRegisterType<BarItem>("ShapesOriginal", 8, 0, "Bar");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/chart1.qml")));

    return app.exec();
}
