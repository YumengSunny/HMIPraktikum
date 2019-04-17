#include "readdata.h"
#include "wiringPi.h"
#include "softPwm.h"
#include "softTone.h"
#include "wiringPiI2C.h"
#include <QTimer>



ReadData::ReadData() {lightTimer = new QTimer(); }


ReadData::~ReadData(){delete lightTimer;}

int ReadData::GPIOSetUp(void)
{
    return wiringPiSetup();
}

void ReadData::SetPinMode(int pin, int mode)
{
    pinMode(pin, mode);
}

int ReadData::ReadDigital (int pin)
{
    return digitalRead(pin);
}

void ReadData::ShowDigital()
{

    QObject::connect(lightTimer, SIGNAL(timeout()),this, SLOT(UpdateDigital()));
    lightTimer->start(1000);
}


void ReadData::UpdateDigital()
{
    int lightSensorStatus = ReadDigital(4);

    qDebug("Value: %d",lightSensorStatus);

}
