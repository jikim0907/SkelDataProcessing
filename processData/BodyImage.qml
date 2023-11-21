import QtQuick 2.15

Item {
    property string imgFileIdx: "000"
    property int idx: 0

    Timer {
        id: myTimer
        interval: 10 // 1000 milliseconds = 1 second
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

    Image{
    id: imageItem
    anchors.fill: parent
    source : "file://mnt/hgfs/share/20231107_Therapy_seq/11_Therapy_body_looping/11_Therapy_body_looping_"+imgFileIdx+".png"
    Behavior on x{ NumberAnimation { duration: 1000 }}
    Behavior on y{ NumberAnimation { duration: 1000 }}
    }
}
