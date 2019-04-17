#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <readdata.h>
#include <wiringPi.h>
#include <QDebug>

int main(int argc, char *argv[])
{


//    QTimer *lightTimer = new QTimer(this);
//        connect(lightTimer, SIGNAL(timeout()), this, SLOT(update()));
//        lightTimer->start(1000);


    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    if (qEnvironmentVariableIsEmpty("QTGLESSTREAM_DISPLAY")) {
        qputenv("QT_QPA_EGLFS_PHYSICAL_WIDTH", QByteArray("213"));
        qputenv("QT_QPA_EGLFS_PHYSICAL_HEIGHT", QByteArray("120"));

        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    }

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    ReadData rd;
    rd.GPIOSetUp();
    rd.SetPinMode(4,INPUT);
    rd.ShowDigital();

    return app.exec();
}
