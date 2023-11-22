import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import processdata 1.0
import QtMultimedia 5.12

Window{
    id: root
    width: 500
    height: 500
    visible:true
    title:qsTr("Therapy")
    color:"Black"

    property int display_width : root.width
    property int display_height  : root.height

    property double lefthead_x : 0
    property double lefthead_y : 0
    property int RL_imgFileIdx : 0
    Connections{
        target: ProcessData

        onHeadPosition:{
            headImg.x = x*display_width
//            headImg.y = (1 - y)*display_height
            headImg.y = y*display_height
            headImg.visible =true

        }
        onLeftEarPosition:{
            lefthead_x = x*display_width
//            lefthead_y = (1 - y)*display_height
            lefthead_y = y*display_height
        }
        onRightEarPosition:{
//            headImg.rotation = (-1)*ProcessData.calSlope(lefthead_x, lefthead_y ,
//                                                    x, (1 - y)*display_height);
        }
        onBodyPosition:{
            bodyImg.x = x*display_width
            bodyImg.y = y*display_height
            bodyImg.visible =true
        }
        onLeftShoulderPosition:{
            leftShoulderImg.x = x*display_width
//            leftShoulderImg.y = (1 - y)*display_height
            leftShoulderImg.y = y*display_height
            leftShoulderImg.visible =true
        }
        onRightShoulderPosition:{
            rightShoulderImg.x = x*display_width
//            rightShoulderImg.y = (1 - y)*display_height
            rightShoulderImg.y = y*display_height
            rightShoulderImg.visible =true
            RL_imgFileIdx = imgFileIdx +30

            neckImg.x = (leftShoulderImg.x - rightShoulderImg.x)/2
            neckImg.y = headImg.y
//            neckImg.visible =true
        }
        onLeftArmPosition:{
            leftArmImg.x = x*display_width
//            leftArmImg.y = (1 - y)*display_height
            leftArmImg.y = y*display_height
            leftArmImg.visible =true
        }
        onRightArmPosition:{
            rightArmImg.x = x*display_width
//            rightArmImg.y = (1 - y)*display_height
            rightArmImg.y = y*display_height
            rightArmImg.visible =true
        }
        onLeftHandPosition:{
            leftHandImg.x = x*display_width
//            leftHandImg.y = (1 - y)*display_height
            leftHandImg.y = y*display_height
            leftHandImg.visible =true
        }
        onRightHandPosition:{
            rightHandImg.x = x*display_width
//            rightHandImg.y = (1 - y)*display_height
            rightHandImg.y = y*display_height
            rightHandImg.visible =true
        }
        onLeftPinkyPosition:{
//            leftHandImg.rotation = (-1)*ProcessData.calSlope(leftHandImg.x, leftHandImg.y ,
//                                                             x, (1 - y)*display_height);
                leftHandImg.rotation = (-1)*ProcessData.calSlope(leftHandImg.x, leftHandImg.y ,
                                                                 x, y*display_height);
        }
        onRightPinkyPosition:{
//            rightHandImg.rotation = (-1)*ProcessData.calSlope(rightHandImg.x, rightHandImg.y ,
//                                                              x, (1 - y)*display_height);
            rightHandImg.rotation = (-1)*ProcessData.calSlope(rightHandImg.x, rightHandImg.y ,
                                                              x, y*display_height);
        }

    }

    property string imgFileIdx: "000"
    property int idx: 0

    Item{
        Timer {
            id: myTimer
            interval: 10
            running: true
            repeat: true // Set to true if you want the timer to repeat

            onTriggered: {
                var idxNumber= idx.toString();
                imgFileIdx = "000".substring(idxNumber.length) + idxNumber;
                idx++;

                if(idx == 200){
                    idx = 0;
                }
            }
        }
    }

    HeadImage {
        id:headImg
        width: 200
        height: 200
    }
    NeckImage{
        id:neckImg
        width: 200
        height:200
        visible: false
    }
    BodyImage{
        id:bodyImg
        width: 200
        height:200
    }
    ShoulderImage {
        id:leftShoulderImg
        width: 200
        height: 200
    }
    ShoulderImage {
        id:rightShoulderImg
        width: 200
        height: 200
    }
    ArmImage {
        id:leftArmImg
        width: 200
        height: 200
    }
    ArmImage {
        id:rightArmImg
        width: 200
        height: 200
    }
    HandImage
    {
        id:leftHandImg
        width: 200
        height: 200
    }
    HandImage
    {
        id:rightHandImg
        width: 200
        height: 200
    }

    Component.onCompleted: {
    }
}
