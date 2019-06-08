#ifndef BASESENSOR_H
#define BASESENSOR_H
#include <QObject>


class BaseSensor : public QObject
{

public:
    BaseSensor(){}
    virtual ~BaseSensor(){}
    virtual void ShowData()=0;
    virtual void updateData()=0;
    virtual int getLight()=0 ;
    virtual float getTemperature()=0;
    virtual float getHumidity()=0;
    virtual float getPressure()=0;
    virtual float getMyAltitude()=0;
};

#endif // BASESENSOR_H
