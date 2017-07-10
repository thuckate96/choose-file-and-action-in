import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import myTimer 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    property var imgUrl: []
    property var nay: ""
    property int count: 0
    FileDialog{
        id: fileDialog
        nameFilters: ["*.png", "*.jpg", "All file (*)"]
        folder: shortcuts.music+"/bibi_data/characters/thumbnail"
        //Component.onCompleted: visible = true
        selectMultiple: btnOpenFile.__action
        onAccepted: {
            console.log("you choose "+ fileDialog.fileUrls)
            isChoose()
            nay = imgUrl[0]
        }

    }
    Image {
        id: abc
        width: 100
        height: 150
        source: nay
        Drag.active: imgDrag.drag.active
        Drag.hotSpot.x: abc.x
        Drag.hotSpot.y: abc.y
        MouseArea{
            id: imgDrag
            anchors.fill: parent
            drag.target: parent
        }
    }

    Button{
        id: btnOpenFile
        text: "Open file"
        onClicked: {
            fileDialog.open()
            fileDialog.selectMultiple
            newImg()
        }
    }
    Button{
        anchors.left: btnOpenFile.right
        id: btnUpdate
        text: "Run"
        onClicked: {
            if(imgUrl.length > 0)
                timer.start()
            else msgChooseImg.text = "Please Choose images"
        }
    }
    Text {id: msgChooseImg; anchors.top: btnUpdate.bottom; color: "red" }
    QTimer{
        id: timer
        interval: 200
        onTimeout: {
            updateImg()
        }
    }

    function isChoose(){

        var arr= fileDialog.fileUrls
        console.log("Do dai cua mang"+arr.length)
        for(var i = 0; i < arr.length; i++){
            imgUrl.push(arr[i]);
        }

    }
    function updateImg(){
        nay = imgUrl[count++]
        if(count > imgUrl.length-1) count = 0;

    }
    function newImg(){
        msgChooseImg.text = ""
       timer.stop()
        while(imgUrl.length > 0)
            imgUrl.pop()

    }
}
