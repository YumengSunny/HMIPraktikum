#include "readdata.h"
#include "wiringPi.h"
#include "softPwm.h"
#include "softTone.h"
#include "wiringPiI2C.h"
#include <math.h>
#include "bme280.h"
#include <QTimer>



ReadData::ReadData()
    :m_light(0),
     m_temperature(0.00),
     m_humidity(0.00),
     m_pressure(0.00),
     m_altitude(0.00),
     m_isBlocked(false)
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

    QObject::connect(m_lightTimer, SIGNAL(timeout()),this, SLOT(UpdateData()));
    m_lightTimer->start(1000);
}

void ReadData::UpdateData()
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
    m_isBlocked?void():(emit tempChanged());
    m_pressure = compensatePressure(raw.pressure, &cal, t_fine) / 100; // hPa
    m_isBlocked?void():(emit pressChanged());
    m_humidity = compensateHumidity(raw.humidity, &cal, t_fine);       // %
    m_isBlocked?void():(emit humidChanged());
    m_altitude = getAltitude(m_pressure);                         // meters
    m_isBlocked?void():(emit altChanged());
    m_light = digitalRead(4);
    m_isBlocked?void():(emit lightChanged());

    qDebug("{\"sensor\":\"bme280\",\"light\":%d, \"humidity\":%.2f, \"pressure\":%.2f,"
      " \"temperature\":%.2f, \"altitude\":%.2f, \"timestamp\":%d}\n",
     m_light, m_humidity, m_pressure, m_temperature, m_altitude, (int)time(nullptr));

}

bool ReadData::blockSignal()
{
    if (!m_isBlocked)
    {
        m_isBlocked=true;
        emit blockChanged();
    }

    return m_isBlocked;
}

bool ReadData::unblockSignal()
{
    if(m_isBlocked)
    {
        m_isBlocked=false;
        emit blockChanged();
    }

    return !m_isBlocked;
}

int ReadData::getLight() const
{
    return m_light;
}
float ReadData:: getTemperature() const
{
    return m_temperature;
}
float ReadData::getHumidity() const
{
    return m_humidity;
}
float ReadData:: getPressure() const
{
    return m_pressure;
}
float ReadData::getMyAltitude() const
{
    return m_altitude;
}

bool ReadData::getIsBlocked() const
{
    return m_isBlocked;
}



