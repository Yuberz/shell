import qs.components
import qs.components.effects
import qs.services
import qs.config
import qs.utils
import QtQuick
Item {
    id: root
    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            const visibilities = Visibilities.getForActive();
            visibilities.launcher = !visibilities.launcher;
        }
    }
    StyledText {
        anchors.centerIn: parent
        text: ""
        font.pointSize: Appearance.font.size.large * 0.95
        color: Colours.palette.m3secondary
    }
    implicitWidth: Appearance.font.size.large * 0.95
    implicitHeight: Appearance.font.size.large * 0.95
}
