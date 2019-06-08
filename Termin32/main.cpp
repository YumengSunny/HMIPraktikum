//#include <QGuiApplication>
#include <QtWidgets/QApplication>
#include <QQmlApplicationEngine>


#include <QQmlContext>
#include <QDebug>
#include <QQuickView>
#include <QtGamepad/QGamepad>
#include <datamodel.h>
#include <basesensor.h>


#ifdef Q_OS_WIN32
   #include <readpseudo.h>
#else
   #include <readdata.h>
#endif

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    if (qEnvironmentVariableIsEmpty("QTGLESSTREAM_DISPLAY")) {
        qputenv("QT_QPA_EGLFS_PHYSICAL_WIDTH", QByteArray("213"));
        qputenv("QT_QPA_EGLFS_PHYSICAL_HEIGHT", QByteArray("120"));

        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    }

    QCoreApplication::setApplicationName("GamepadSNES");
    QCoreApplication::setOrganizationName("hda");
    QCoreApplication::setOrganizationDomain("org.hda");
    QApplication app(argc, argv);




    #ifdef Q_OS_WIN32

        BaseSensor *pcSensor=new readpseudo();
    #else
        BaseSensor *pcSensor=new  ReadData();
    #endif

    dataModel myModel(pcSensor);
    QQmlApplicationEngine engine;
    QQmlContext *ctxt = engine.rootContext();
    ctxt->setContextProperty("myModel", &myModel);

    //ctxt->setContextProperty("pcSensor", QVariant::fromValue(pcSensor));
    //engine.rootContext()->setProperty("myclass", QVariant::fromValue(&mc));
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;


    pcSensor->ShowData();

    return app.exec();
}
