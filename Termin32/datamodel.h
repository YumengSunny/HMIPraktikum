#ifndef DATAMODEL_H
#define DATAMODEL_H

#include <QtGlobal>
#include <QStandardItemModel>
#include "basesensor.h"
#include <iomanip>



class dataModel:public QStandardItemModel
{
    Q_OBJECT
    Q_PROPERTY(int light READ getLight NOTIFY lightChanged)
    Q_PROPERTY(float temperature READ getTemperature NOTIFY tempChanged)
    Q_PROPERTY(float humidity READ getHumidity NOTIFY humidChanged)
    Q_PROPERTY(float pressure READ getPressure NOTIFY pressChanged)
    Q_PROPERTY(float altitude READ getMyAltitude NOTIFY altChanged)
    Q_PROPERTY(bool isBlocked READ getIsBlocked NOTIFY blockChanged)


public:
    explicit dataModel(BaseSensor* pcSensor=nullptr);
    enum ItemRoles{
            lightRole = Qt::UserRole + 1,
            tempRole,
            humidRole,
            pressRole,
            altiRole
        };
    QHash<int,QByteArray> roleNames() const;
    int getLight();
    float getTemperature();
    float getHumidity();
    float getPressure();
    float getMyAltitude();
    bool getIsBlocked();
    Q_INVOKABLE bool blockSignal();
    Q_INVOKABLE bool unblockSignal();

signals:
    void lightChanged();
    void tempChanged();
    void humidChanged();
    void pressChanged();
    void altChanged();
    void blockChanged();


public slots:
    void setupModel();
private:
    BaseSensor* pcSensor;
    bool m_isBlocked;

};

#endif // DATAMODEL_H
