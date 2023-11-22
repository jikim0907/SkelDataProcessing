import QtQuick 2.15

Item {
    property string imgFileIdx: "000"
    property int idx: 0
    property string filePath : "/mnt/hgfs/share/20231107_Therapy_seq"

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
}
