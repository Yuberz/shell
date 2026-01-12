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
                    color: root.pressed ? Qt.darker("#f47251", 1.5) : 
                                   root.hovered ? Qt.lighter("#f47251", 0.5) : 
                                   "transparent"
                    radius: width / 2
                }
    
    contentItem: Text {
        text: ""
        color: "#f47251"
        font.pixelSize: 20
        font.bold: false
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    
    onClicked: {
    zenProcess.running = true
    }

    Process {
            id: zenProcess
            command: ["zen-browser"]
            onExited: function(exitCode) {
                if (exitCode !== 0) {
                    console.log("zen-browser exited with code:", exitCode);
                }
            }
        }

}
