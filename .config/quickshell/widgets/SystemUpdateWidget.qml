import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import qs.singletons

TextWidget {
    id:             root
    inhalt:         "󰚰"
    inhaltcolor:    Colors.text
    color:          Colors.bar
    visible:        true

    Process {
        id: update
        command: ["echo","done"]
        stdout: StdioCollector {
            onStreamFinished: {
                const t = this.text;
                root.inhalt = t
            }
        }
    }

    function click() {
        update.running  = true;
    }
    function enter() {
        root.inhalt = "update system"
    }
    function exit() {
        root.inhalt = "󰚰"
    }


}
