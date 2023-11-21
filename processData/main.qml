import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import processdata 1.0
import QtMultimedia 5.12

Window{
    id: root
    width: 3440
    height: 1440
    visible:true
    title:qsTr("Therapy")
    color:"Black"

    property int display_width : root.width
    property int display_height  : root.height

    property double lefthead_x : 0
    property double lefthead_y : 0

    Connections{
        target: ProcessData

        onHeadPosition:{
            headImg.x = x*display_width
            headImg.y = (y-1)*display_height
        }
        onLeftEarPosition:{
            lefthead_x = x*display_width
            lefthead_y = (y-1)*display_height
        }
        onRihgtEarPosition:{
            headImg.rotation = (-1)*ProcessData.calSlope(lefthead_x, lefthead_y ,
                                                    x, (y - 1)*display_height);
        }
        onBodyPosition:{
            bodyImg.x = x*display_width
            bodyImg.y = y*display_height
        }
        onLeftShoulderPosition:{
            leftShoulderImg.x = x*display_width
            leftShoulderImg.y = (y-1)*display_height
        }
        onRightShoulderPosition:{
            rightShoulderImg.x = x*display_width
            rightShoulderImg.y = (y-1)*display_height

            neckImg.x = (leftShoulderImg.x - rightShoulderImg.x)/2
            neckImg.y = headImg.y
        }
        onLeftArmPosition:{
            leftArmImg.x = x*display_width
            leftArmImg.y = (y-1)*display_height
        }
        onRightArmPosition:{
            rightArmImg.x = x*display_width
            rightArmImg.y = (y-1)*display_height
        }
        onLeftHandPosition:{
            leftHandImg.x = x*display_width
            leftHandImg.y = (y-1)*display_height
        }
        onRightHandPosition:{
            rightHandImg.x = x*display_width
            rightHandImg.y = (y-1)*display_height
        }
        onLeftPinkyPosition:{
            leftHandImg.rotation = (-1)*ProcessData.calSlope(leftHandImg.x, leftHandImg.y ,
                                                             x, (y - 1)*display_height);
        }
        onRightPinkyPosition:{
            rightHandImg.rotation = (-1)*ProcessData.calSlope(rightHandImg.x, rightHandImg.y ,
                                                              x, (y - 1)*display_height);
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
}
