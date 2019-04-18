/*************************************************************************
 *
 * Copyright (c) 2018 Qt Company
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

#include "tcpconnectionelement.h"
#include <QHostAddress>

#include <QTcpServer>
#include <QTcpSocket>

TcpConnectionElement::TcpConnectionElement(QObject *parent)
    : QObject(parent)
    , m_hostAddress(QHostAddress::LocalHost)
{
}

void TcpConnectionElement::sendData(const QString &data)
{
    m_tcpSocket->write(data.toUtf8() + "\n");
}

int TcpConnectionElement::port() const
{
    return m_port;
}

void TcpConnectionElement::setPort(int port)
{
    if (m_port != port) {
        m_port = port;
        Q_EMIT portChanged();
    }
}

QHostAddress TcpConnectionElement::hostAddress() const
{
    return m_hostAddress;
}

void TcpConnectionElement::setHostAddress(const QHostAddress &hostAddress)
{
    if (m_hostAddress != hostAddress) {
        m_hostAddress = hostAddress;
        Q_EMIT hostAddressChanged();
    }
}

TcpConnectionElement::ConnectionType TcpConnectionElement::connectionType() const
{
    return m_connectionType;
}

void TcpConnectionElement::setConnectionType(ConnectionType connectionType)
{
    if (m_connectionType != connectionType) {
        m_connectionType = connectionType;
        emit connectionTypeChanged();
    }
}

void TcpConnectionElement::initialize()
{
    if (m_connectionType == Server) {
        m_tcpServer = new QTcpServer;
        m_tcpServer->listen(m_hostAddress, m_port);
        connect(m_tcpServer, &QTcpServer::newConnection, this, &TcpConnectionElement::slotConnection);
    }
    else {
        m_tcpSocket = new QTcpSocket(this);
        m_tcpSocket->connectToHost(m_hostAddress, m_port);
        connect(m_tcpSocket, &QTcpSocket::readyRead, this, &TcpConnectionElement::receivedData);
    }
}

void TcpConnectionElement::slotConnection()
{
    m_tcpSocket = m_tcpServer->nextPendingConnection();
    connect(m_tcpSocket, &QTcpSocket::readyRead, this, &TcpConnectionElement::receivedData);
}

void TcpConnectionElement::receivedData()
{
    const QString txt = QString::fromUtf8(m_tcpSocket->readAll());
    Q_EMIT dataReceived( txt );
}


