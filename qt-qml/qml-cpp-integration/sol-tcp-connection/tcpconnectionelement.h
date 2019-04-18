/*************************************************************************
 *
 * Copyright (c) 2018 Qt Company
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

#ifndef TCPCONNECTIONELEMENT_H
#define TCPCONNECTIONELEMENT_H

#include <QObject>
#include <QHostAddress>

class QTcpServer;
class QTcpSocket;

class TcpConnectionElement : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int port READ port WRITE setPort NOTIFY portChanged)
    Q_PROPERTY(QHostAddress hostAddress READ hostAddress WRITE setHostAddress NOTIFY hostAddressChanged)
    Q_PROPERTY(ConnectionType type READ connectionType WRITE setConnectionType NOTIFY connectionTypeChanged)

public:
    enum ConnectionType
    {
        Client,
        Server
    };
    Q_ENUMS(ConnectionType)

    TcpConnectionElement(QObject *parent = Q_NULLPTR);

    void setConnectionType(ConnectionType connectionType);
    ConnectionType connectionType() const;

    void setPort(int port);
    int port() const;

    void setHostAddress(const QHostAddress &hostAddress);
    QHostAddress hostAddress() const;

Q_SIGNALS:
    void dataReceived( const QString &data );
    void portChanged();
    void hostAddressChanged();
    void connectionTypeChanged();

public Q_SLOTS:
    void initialize();
    void sendData(const QString &data);

private Q_SLOTS:
    void receivedData();
    void slotConnection();

private:
    unsigned int m_port;
    QHostAddress m_hostAddress;
    ConnectionType m_connectionType;

    QTcpServer *m_tcpServer;
    QTcpSocket *m_tcpSocket;
};

Q_DECLARE_METATYPE(QHostAddress)

#endif
