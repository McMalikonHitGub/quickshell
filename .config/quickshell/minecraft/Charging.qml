import Quickshell
import Quickshell.Io 
import QtQuick
import qs.widgets
import qs.themes

ObjectWidget {
    id:             container
    border.color:   "gray"
    color:          Qt.rgba(0.2,0.2,0.2,1)
    implicitWidth:  row.width + 10

    Row {
        id:row
        anchors.centerIn: parent
        TextWidget {
            id: icon
            inhalt: ""
            inhaltcolor: "white"
        }

        TextWidget {
            id: word
            inhalt:         ""
            inhaltcolor:    Themes.textcolor[Themes.theme_number]
        }

        Process {
            id: readChargingStatus
            command:["cat","/sys/class/power_supply/BAT0/status"]
            running: true

            stdout: StdioCollector {
                onStreamFinished: {
                    const res   = this.text.trim();
                    //inhalt      = res;
                    if (res === "Discharging") {
                        word.inhalt     = "Wither";
                        icon.inhalt     = "file:///home/malik/.config/quickshell/minecraft/icons/Wither.png"
                    } else if (res === "Charging") {
                        word.inhalt     = "Regeneration";
                        icon.inhalt     = "file:///home/malik/.config/quickshell/minecraft/icons/Regeneration.png"
                    }
                }
            }
        }
    }
}
