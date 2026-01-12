pragma ComponentBehavior: Bound
import qs.components
import qs.services
import QtQuick
import QtQuick.Controls
import Quickshell.Io

Button {
    id: root
    
    width: 30
    height: 30
    
    background: Rectangle {
        color: root.pressed ? Qt.darker("#fea600", 1.5) : 
                       root.hovered ? Qt.lighter("#fea600", 0.5) : 
                       "transparent"
        radius: width / 2
    }
    
    contentItem: Text {
        text: ""
        color: "#fea600"
        font.pixelSize: 20
        font.bold: false
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    
    onClicked: {
    lutrisProcess.running = true
    }

    Process {
            id: lutrisProcess
            command: ["lutris"]
            onExited: function(exitCode) {
                if (exitCode !== 0) {
                    console.log("lutris exited with code:", exitCode);
                }
            }
        }

}
