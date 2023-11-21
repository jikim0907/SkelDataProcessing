import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import skelpointloader 1.0
import QtMultimedia 5.12

Window{
    id: root
    width: 3440
    height: 1440
    visible:true
    title:qsTr("Therapy")
    color:"Black"

    property int normalizationWidth: root.width
    property int normalizationHeight: root.height

    Connections{
        target: SkelPointLoader

        onHeadPosition:{
            headImg.x = x*normalizationWidth
            headImg.y = y*normalizationWidth
        }
        onBodyPosition:{
            bodyImg.x = x*normalizationWidth
            bodyImg.y = y*normalizationWidth
        }
        onLeftShoulderPosition:{
            leftShoulderImg.x = x*normalizationWidth
            leftShoulderImg.y = y*normalizationWidth
            leftShoulderImg.rotation = rot
        }
        onRightShoulderPosition:{
            rightShoulderImg.x = x*normalizationWidth
            rightShoulderImg.y = y*normalizationWidth
            rightShoulderImg.rotation = rot
        }
        onLeftArmPosition:{
            leftArmImg.x = x*normalizationWidth
            leftArmImg.y = y*normalizationWidth
            leftArmImg.rotation = rot
        }
        onRightArmPosition:{
            rightArmImg.x = x*normalizationWidth
            rightArmImg.y = y*normalizationWidth
            rightArmImg.rotation = rot
        }
        onLeftHandPosition:{
            leftHandImg.x = x*normalizationWidth
            leftHandImg.y = y*normalizationWidth
            leftHandImg.rotation = rot
        }
        onRightHandPosition:{
            rightHandImg.x = x*normalizationWidth
            rightHandImg.y = y*normalizationWidth
            rightHandImg.rotation = rot
        }
    }

    HeadImage {
        id:headImg
        width: 260
        height: 260

    }

    NeckImage{
        id:neckImg
        width: 120
        height:150
        visible: false //temp
    }

    BodyImage{
        id:bodyImg
        width: 120
        height:150
        visible: false //temp
    }

    ShoulderImage {
        id:leftShoulderImg
        width: 260
        height: 260

    }

    ShoulderImage {
        id:rightShoulderImg
        width: 260
        height: 260
    }

    ArmImage {
        id:leftArmImg
        width: 260
        height: 260
    }

    ArmImage {
        id:rightArmImg
        width: 260
        height: 260
    }

    HandImage
    {
        id:leftHandImg
        width: 260
        height: 260
    }

    HandImage
    {
        id:rightHandImg
        width: 260
        height: 260
    }

    Component.onCompleted: {
        SkelPointLoader.readCoordinatesTimer();
    }
}
