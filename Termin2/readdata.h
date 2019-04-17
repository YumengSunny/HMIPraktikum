#ifndef READDATA_H
#define READDATA_H


#include<QTimer>

class ReadData:public QObject
{
     Q_OBJECT
public:
    ReadData();

    ~ReadData();
    int GPIOSetUp();
    void SetPinMode(int,int);
    int ReadDigital (int);
    void ShowDigital();
private:
    QTimer *lightTimer;

public Q_SLOTS:
    void UpdateDigital();
};
#endif // READDATA_H
