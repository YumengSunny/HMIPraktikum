#ifndef READPSEUDO_H
#define READPSEUDO_H
#include <QTimer>
#include "datamodel.h"
#include "basesensor.h"

class readpseudo:public BaseSensor
{
    Q_OBJECT


public:
    readpseudo();
    ~readpseudo();
    virtual void ShowData();
    float generatepseudo(int, int);
    virtual int getLight();
    virtual float getTemperature();
    virtual float getHumidity();
    virtual float getPressure();
    virtual float getMyAltitude();
    bool getIsBlocked();


private:
    int lightSensor=0;
    float tempSensor=0.0;
    float humidSensor=0.0;
    float pressSensor=0.0;
    float altiSensor=0.0;
    QTimer *m_lightTimer;
    BaseSensor *pcSensor;
    int count;



public slots:
    void updateData();

};

#endif // READPSEUDO_H
