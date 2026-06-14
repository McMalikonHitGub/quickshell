import Quickshell
import Quickshell.Io
import QtQuick

pragma Singleton

Singleton {
    property var device: ""
    property real batteryPercent:   100
    property var charging:          ""
    property var timeremaining:     "test"
    Process {
        id: batperc
        running: true
        command: ["acpi"]
        stdout: StdioCollector {
            onStreamFinished: {
                const parts     = this.text.split(",");
                device          = parts[0].split(":")[0];
                charging        = parts[0].split(":")[1]; 
                batteryPercent  = parts[1].replace("%", "").trim();

                
                if (parts.length === 3) {
                    timeremaining=parts[2].trim();
                } else {
                    timeremaining = "infinity remaining"
                }
            }
        }
    }
    Timer {
        interval: 1000*60*5
        running: true
        repeat: true
        onTriggered: batperc.running=true
    }
}
