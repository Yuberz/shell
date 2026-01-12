import qs.components
import qs.services
import qs.config
import Quickshell
import QtQuick
import Quickshell.Io

Item {
    id: root

    required property PersistentProperties visibilities

    implicitWidth: icon.implicitHeight + Appearance.padding.small * 2
    implicitHeight: icon.implicitHeight

    StateLayer {
        // Cursed workaround to make the height larger than the parent
        anchors.fill: undefined
        anchors.centerIn: parent
        implicitWidth: implicitHeight
        implicitHeight: icon.implicitHeight + Appearance.padding.small * 2

        radius: Appearance.rounding.full

        function onClicked(): void {
            wlogoutProcess.running = true;
        }

        Process {
                    id: wlogoutProcess
                    command: ["wlogout"]
                    onExited: {
                        if (exitCode !== 0) {
                            console.log("wlogout exited with code:", exitCode);
                        }
                    }
                }
    }

    MaterialIcon {
        id: icon

        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -1

        text: "power_settings_new"
        color: Colours.palette.m3error
        font.bold: true
        font.pointSize: Appearance.font.size.normal
    }
}


