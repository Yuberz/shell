pragma ComponentBehavior: Bound
import qs.components
import qs.services
import QtQuick
import QtQuick.Controls

Button {
    id: root
    
    width: 30
        height: 30
        
        background: Rectangle {
                color: root.pressed ? Qt.darker("#66c0f4", 1.5) : 
                               root.hovered ? Qt.lighter("#66c0f4", 0.5) : 
                               "transparent"
                radius: width / 2
            }
    
    contentItem: Text {
        text: ""
        color: "#66c0f4"  // Steam blue
        font.pixelSize: 20
        font.bold: false
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    
    onClicked: {
        Qt.openUrlExternally("steam://open/main")
    }
}
