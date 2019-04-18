#ifndef READDATA_H
#define READDATA_H


#include<QTimer>


class ReadData:public QObject
{
     Q_OBJECT
     Q_PROPERTY(int lightValue READ getLight NOTIFY lightChanged)
     Q_PROPERTY(float temperature READ getTemperature NOTIFY tempChanged)
     Q_PROPERTY(float humidity READ getHumidity NOTIFY humidChanged)
     Q_PROPERTY(float pressure READ getPressure NOTIFY pressChanged)
     Q_PROPERTY(float altitude READ getMyAltitude NOTIFY altChanged)
     Q_PROPERTY(bool isBlocked READ getIsBlocked NOTIFY blockChanged)

public:
    ReadData();
    ~ReadData();
    int GPIOSetUp();
    void SetPinMode(int,int);
    void ShowData();
    int getLight() const;
    float getTemperature() const;
    float getHumidity() const;
    float getPressure() const;
    float getMyAltitude() const;
    bool getIsBlocked() const;
    Q_INVOKABLE bool blockSignal();
    Q_INVOKABLE bool unblockSignal();

private:
    QTimer *m_lightTimer;
    int m_light;
    float m_temperature;
    float m_humidity;
    float m_pressure;
    float m_altitude;
    bool m_isBlocked;

signals:
    void lightChanged();
    void tempChanged();
    void humidChanged();
    void pressChanged();
    void altChanged();
    void blockChanged();

public slots:
    void UpdateData();
};
#endif // READDATA_H
