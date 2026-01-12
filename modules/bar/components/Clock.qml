pragma ComponentBehavior: Bound
import qs.components
import qs.services
import qs.config
import QtQuick

Column {
    id: root
    property color colour: Colours.palette.m3secondary
    spacing: Appearance.spacing.small
    
    Loader {
        anchors.horizontalCenter: parent.horizontalCenter
        active: Config.bar.clock.showIcon
        visible: active
        asynchronous: true
        sourceComponent: MaterialIcon {
            text: "calendar_month"
            color: root.colour
        }
    }


    
    Column {
        id: timeColumn
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 0
        
        // Hour component
        StyledText {
            id: hourText
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: StyledText.AlignHCenter
            text: {
                                    // Force 12-hour format by extracting from full time string
                                    const fullTime = Time.format("h:mm AP");
                                    return fullTime.split(':')[0].padStart(2, '0');
                                }
            font.pointSize: Appearance.font.size.smaller
            font.family: Appearance.font.family.mono
            color: Colours.palette.m3primary
        }
        
        // Minute component
        StyledText {
            id: minuteText
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: StyledText.AlignHCenter
            text: Time.format("mm")
            font.pointSize: Appearance.font.size.smaller
            font.family: Appearance.font.family.mono
            color: Colours.palette.m3secondary
        }
        
        // AM/PM component (only show for 12-hour clock)
        StyledText {
            id: ampmText
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: StyledText.AlignHCenter
            text: Time.format("A")
            font.pointSize: Appearance.font.size.smaller
            font.family: Appearance.font.family.mono
            color: Colours.palette.m3tertiary
            visible: true
        }
    }
}
