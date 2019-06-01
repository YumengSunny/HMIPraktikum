#ifndef READDATA_H
#define READDATA_H


#include<QTimer>
#include"basesensor.h"


class ReadData:public QObject,public BaseSensor
{
     Q_OBJECT


public:
    ReadData();
    ~ReadData();
    int GPIOSetUp();
    void SetPinMode(int,int);
    virtual void ShowData();
    virtual int getLight();
    virtual float getTemperature();
    virtual float getHumidity();
    virtual float getPressure();
    virtual float getMyAltitude();


private:
    QTimer *m_lightTimer;
    int m_light=0;
    float m_temperature=0.0;
    float m_humidity=0.0;
    float m_pressure=0.0;
    float m_altitude=0.0;




public slots:
    void updateData();
};
#endif // READDATA_H
