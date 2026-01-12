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
            color: root.pressed ? Qt.darker("#5FED83", 1.5) : 
                           root.hovered ? Qt.lighter("#5FED83", 0.5) : 
                           "transparent"
            radius: width / 2
        }
    
    contentItem: Text {
        text: ""
        color: "#5FED83"
        font.pixelSize: 20
        font.bold: false
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    
    onClicked: {
    githubProcess.running = true
    }

    Process {
            id: githubProcess
            command: ["github-desktop"]
            onExited: function(exitCode) {
                if (exitCode !== 0) {
                    console.log("github-desktop exited with code:", exitCode);
                }
            }
        }

}
