#include "processdata.h"


processdata* processdata::mInstance = NULL;

processdata::processdata(QObject *parent): QObject(parent){
    this->initSocket();
    mInstance = this;
}

processdata *processdata::getInstance()
{
    std::cout << " getinstance "<<mInstance <<std::endl;
    return mInstance;
}

void processdata::initSocket(){
    socket = new QUdpSocket();
    socket->bind(QHostAddress::LocalHost, 5000); //To to bind to HostAddress to receive the data
    qDebug() << "client UDP socket has been created";

    connect(socket, SIGNAL(readyRead()),
            this, SLOT(readPendingDatagrams()));

    connect(this, SIGNAL(sendbuffer(QByteArray)),
            this, SLOT(jsonParsing(QByteArray)));
}

double processdata::calSlope(double x1, double y1, double x2, double y2){
    if (x1 == x2) { return 0.0; }
    return (y2 - y1) / (x2 - x1);
}

void processdata::readPendingDatagrams(){
    while (socket->hasPendingDatagrams())
    {
        datagram = socket->receiveDatagram();

        buffer.resize(socket->pendingDatagramSize());
        buffer = datagram.data();

        emit sendbuffer(buffer);
    }
}

void processdata::jsonParsing(QByteArray tmpbuffer)
{
    qDebug() << "start parsing ...";

    jsonDoc = QJsonDocument::fromJson(tmpbuffer);
    jsonObject = jsonDoc.object();

    QJsonValue jsonObjPose = jsonObject.value("pose");
    QJsonArray coordArray = jsonObjPose.toArray();

    for(int i = 0; i<coordArray.count();i++){

        QJsonObject coorObj = coordArray.at(i).toObject();

        xPosition = coorObj["x"].toDouble()/1000;
//        xPosition = xPosition/1000;
        yPosition = coorObj["y"].toDouble()/1000;
//        yPosition = yPosition/1000;

        switch (i) {
        case 0 :
            emit headPosition(xPosition,yPosition);
            break;
        case 7:
            emit leftEarPosition(xPosition,yPosition);
            break;
        case 8:
            emit rightEarPosition(xPosition,yPosition);
            break;
        case 11:
            emit leftShoulderPosition(xPosition,yPosition);
            break;
        case 12:
            emit rightShoulderPosition(xPosition,yPosition);
            break;
        case 13:
            emit leftArmPosition(xPosition,yPosition);
            break;
        case 14:
            emit rightArmPosition(xPosition,yPosition);
            break;
        case 15:
            emit leftHandPosition(xPosition,yPosition);
            break;
        case 16:
            emit rightHandPosition(xPosition,yPosition);
            break;
        case 17:
            //leftpinky coordinates for hand rotation
            emit leftPinkyPosition(xPosition,yPosition);
            break;
        case 18:
            //rightpinky coordinates for hand rotation
            emit rightPinkyPosition(xPosition,yPosition);
            break;
        default:
            break;
        }
    }
}
