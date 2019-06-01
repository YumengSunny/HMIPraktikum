#include "readdata.h"
#include "wiringPi.h"
#include "softPwm.h"
#include "softTone.h"
#include "wiringPiI2C.h"
#include <math.h>
#include "bme280.h"
#include <QTimer>


ReadData::ReadData()


{
    m_lightTimer = new QTimer();
}


ReadData::~ReadData(){delete m_lightTimer;}

int ReadData::GPIOSetUp(void)
{
    return wiringPiSetup();
}

void ReadData::SetPinMode(int pin, int mode)
{
    pinMode(pin, mode);
}

void ReadData::ShowData()
{

    GPIOSetUp();
    SetPinMode(4,INPUT);
    QObject::connect(m_lightTimer, SIGNAL(timeout()),this, SLOT(updateData()));
    m_lightTimer->start(1000);
}

void ReadData::updateData()
{
    int fd = wiringPiI2CSetup(BME280_ADDRESS);
    if(fd < 0) {
      qDebug("Device not found");
      return;
    }
    bme280_calib_data cal;
    readCalibrationData(fd, &cal);

    wiringPiI2CWriteReg8(fd, 0xf2, 0x01);   // humidity oversampling x 1
    wiringPiI2CWriteReg8(fd, 0xf4, 0x25);   // pressure and temperature oversampling x 1, mode normal

    bme280_raw_data raw;
    getRawData(fd, &raw);

    int32_t t_fine = getTemperatureCalibration(&cal, raw.temperature);
    m_temperature = compensateTemperature(t_fine); // C

    m_pressure = compensatePressure(raw.pressure, &cal, t_fine) / 100; // hPa

    m_humidity = compensateHumidity(raw.humidity, &cal, t_fine);       // %

    m_altitude = getAltitude(m_pressure);                         // meters

    m_light = digitalRead(4);


    qDebug("{\"sensor\":\"bme280\",\"light\":%d, \"humidity\":%.2f, \"pressure\":%.2f,"
      " \"temperature\":%.2f, \"altitude\":%.2f, \"timestamp\":%d}\n",
     m_light, m_humidity, m_pressure, m_temperature, m_altitude, (int)time(nullptr));

}


int ReadData::getLight()
{
    return m_light;
}
float ReadData:: getTemperature()
{
    return m_temperature;
}
float ReadData::getHumidity()
{
    return m_humidity;
}
float ReadData:: getPressure()
{
    return m_pressure;
}
float ReadData::getMyAltitude()
{
    return m_altitude;
}





