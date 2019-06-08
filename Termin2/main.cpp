//#include <QGuiApplication>
#include <QtWidgets/QApplication>
#include <QQmlApplicationEngine>
#include <readdata.h>
#include <QQmlContext>
#include <wiringPi.h>
#include <QDebug>
#include <QQuickView>
#include <QtGamepad/QGamepad>

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

    QCoreApplication::setApplicationName("GamepadSNES");
    QCoreApplication::setOrganizationName("hda");
    QCoreApplication::setOrganizationDomain("org.hda");
    QGuiApplication app(argc, argv);

    ReadData rd;

    QQmlApplicationEngine engine;
    QQmlContext *ctxt = engine.rootContext();
    ctxt->setContextProperty("readData", &rd);

    //QQuickView view;
    //QQmlContext *ctxt=engine.rootContext();
    //view.engine()->rootContext()->setContextProperty("readData", &rd);
    //view.setSource(QUrl::fromLocalFile("main.qml"));
    //view.show();
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    rd.GPIOSetUp();
    rd.SetPinMode(4,INPUT);
    rd.ShowData();


    return app.exec();
}
