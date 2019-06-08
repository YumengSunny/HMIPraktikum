#include "readpseudo.h"
#include <QtGlobal>
#include <QTime>
#include "datamodel.h"
//#include <QTimer>

readpseudo::readpseudo()
{
    this->m_lightTimer = new QTimer();
    this->count=0;
}

readpseudo::~readpseudo()
{

}

void readpseudo::ShowData()
{

    QObject::connect(m_lightTimer, SIGNAL(timeout()),this, SLOT(updateData()));
    m_lightTimer->start(1000);

}

void readpseudo::updateData(){

    this->count++;
    this->lightSensor=count%2;

    this->tempSensor=generatepseudo(20,30);

    this->humidSensor=generatepseudo(40,50);

    this->pressSensor=generatepseudo(900,1000);

    this->altiSensor=generatepseudo(150,170);



    qDebug("{\"sensor\":\"bme280\",\"light\":%d, \"humidity\":%.2f, \"pressure\":%.2f,"
      " \"temperature\":%.2f, \"altitude\":%.2f, \"timestamp\":%d}\n",
     lightSensor, humidSensor, pressSensor, tempSensor, altiSensor, (int)time(nullptr));


}

float readpseudo::generatepseudo(int min, int max){
    Q_ASSERT(min < max);

    static bool seedStatus;
    if (!seedStatus)
    {
        qsrand(QTime(0, 0, 0).secsTo(QTime::currentTime()));
        seedStatus = true;
    }
    int nTemp = qrand() % (max - min);
    float fRandom = (min + nTemp)*1.02;

    return fRandom;

}

int readpseudo::getLight()
{
    return lightSensor;
}
float readpseudo:: getTemperature()
{
    return tempSensor;
}
float readpseudo::getHumidity()
{
    return humidSensor;
}
float readpseudo:: getPressure()
{
    return pressSensor;
}
float readpseudo::getMyAltitude()
{
    return altiSensor;
}

