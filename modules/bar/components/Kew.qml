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
                        color: root.pressed ? Qt.darker("#692cac", 1.5) : 
                                       root.hovered ? Qt.lighter("#692cac", 0.5) : 
                                       "transparent"
                        radius: width / 2
                    }
    
    contentItem: Text {
        text: ""
        color: "#692cac"
        font.pixelSize: 20
        font.bold: false
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    
    onClicked: {
    kewProcess.running = true
    }

    Process {
            id: kewProcess
            command: ["ghostty", "-e", "kew"]
            onExited: function(exitCode) {
                if (exitCode !== 0) {
                    console.log("kew exited with code:", exitCode);
                }
            }
        }

}
