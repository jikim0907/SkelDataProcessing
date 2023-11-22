#ifndef PROCESSDATA_H
#define PROCESSDATA_H

#include <QObject>
#include <QUdpSocket>
#include <QDebug>
#include <QNetworkDatagram>
#include <QByteArray>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <iostream>
struct skelCoordinates
{
    int x;
    int y;
};

struct skelPart
{
    struct skelCoordinates HeadCoord;
    //    struct skelCoordinates BodyCoord;
    struct skelCoordinates MouseCoord;

    struct skelCoordinates rightShoulderCoord;
    struct skelCoordinates leftShoulderCoord;

    struct skelCoordinates rightArmCoord;
    struct skelCoordinates leftArmCoord;

    struct skelCoordinates rightHandCoord;
    struct skelCoordinates leftHandCoord;

    struct skelCoordinates rightThumbCoord;
    struct skelCoordinates leftThumbCoord;

};
class processdata : public QObject
{
    Q_OBJECT
public:
    processdata(QObject *parent = nullptr);
    static processdata *getInstance();
    static processdata *mInstance;

    //For udpProtocol
    QUdpSocket *socket;
    QNetworkDatagram datagram;
    QByteArray buffer;
    void initSocket();

    //For jsonParsing
    QJsonDocument jsonDoc;
    QJsonObject jsonObject;

    struct skelPart skelPartStruct;
    double xPosition ;
    double yPosition ;
    Q_INVOKABLE double calSlope(double x1,double y1,double x2,double y2);


signals:
    //receive Json Data, put Data on it buffer to parsing
    void sendbuffer(QByteArray datagramBuffer);

    //Signals For send the Coordinates Data to qml
    void headPosition(double x, double y);

    void leftEarPosition(double x, double y);
    void rightEarPosition(double x, double y);

    void bodyPosition(double x, double y);

    void leftShoulderPosition(double x, double y);
    void rightShoulderPosition(double x, double y);

    void leftArmPosition(double x, double y);
    void rightArmPosition(double x, double y);

    void leftHandPosition(double x, double y);
    void rightHandPosition(double x, double y);

    void leftPinkyPosition(double x, double y);
    void rightPinkyPosition(double x, double y);


public slots:
    void readPendingDatagrams();

    //For Json Data Parsing
    void jsonParsing(QByteArray buffer);
};

#endif // PROCESSDATA_H
