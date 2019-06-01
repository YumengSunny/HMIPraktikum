#include "datamodel.h"
#include <iomanip>
#ifdef Q_OS_WIN32
    #include "readpseudo.h"
#else
    #include "readdata.h"
#endif


dataModel::dataModel(BaseSensor* pcSensor)
{
    //setupModel();
    this->pcSensor=pcSensor;
}

void dataModel::setupModel()
{
    if(m_isBlocked){
        return;
    }
    QStandardItem *item = new QStandardItem;
    item->setData(pcSensor->getLight(),lightRole);
    m_isBlocked?void():(emit lightChanged());
    item->setData(pcSensor->getTemperature(),tempRole);
    m_isBlocked?void():(emit tempChanged());
    item->setData(pcSensor->getHumidity(),humidRole);
    m_isBlocked?void():(emit humidChanged());
    item->setData(pcSensor->getPressure(),pressRole);
    m_isBlocked?void():(emit pressChanged());
    item->setData(pcSensor->getMyAltitude(),altiRole);
    m_isBlocked?void():(emit altChanged());
    appendRow(item);
}

QHash<int,QByteArray> dataModel::roleNames() const
{
    QHash<int, QByteArray>mapping = QStandardItemModel::roleNames();
    mapping[lightRole] = "light";
    mapping[tempRole] = "temperature";
    mapping[humidRole] = "humidity";
    mapping[pressRole] = "pressure";
    mapping[altiRole] = "altitude";

    return mapping;

}

int dataModel::getLight()
{
    return pcSensor->getLight();
}
float dataModel:: getTemperature()
{
    return pcSensor->getTemperature();
}
float dataModel::getHumidity()
{
    return pcSensor->getHumidity();
}
float dataModel:: getPressure()
{
    return pcSensor->getPressure();
}
float dataModel::getMyAltitude()
{
    return pcSensor->getMyAltitude();
}
bool dataModel::getIsBlocked()
{
    return m_isBlocked;
}
bool dataModel::blockSignal()
{
    if (!m_isBlocked)
    {
        m_isBlocked=true;
        emit blockChanged();
    }

    return m_isBlocked;
}

bool dataModel::unblockSignal()
{
    if(m_isBlocked)
    {
        m_isBlocked=false;
        emit blockChanged();
    }

    return !m_isBlocked;
}

