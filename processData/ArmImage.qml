import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtMultimedia 5.12

Image{
    id: imageItem
    //    anchors.fill: parent
    source : "file://mnt/hgfs/share/20231107_Therapy_seq/11_Therapy_arm_looping/11_Therapy_arm_looping_"+imgFileIdx+".png"
//    Behavior on x{ NumberAnimation { duration: 100 }}
    Behavior on y{ NumberAnimation { duration: 100 }}
    visible:false
}

