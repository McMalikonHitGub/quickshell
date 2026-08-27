import Quickshell
import Quickshell.Io
import QtQuick
import qs.singletons
import qs.functions
import qs.themes

TextWidget {
    id: root
    inhaltcolor: Colors.text
    inhalt: muted ? Themes.mute_icon[Themes.theme_number] : "Volume at: "+volume*100 + "%"

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 200
        }
    }

    property var volume: 0.0
    property bool muted: false

    function click() {
        mute.running = true
    }

    WheelHandler {
        onWheel: (event) => {
            if (event.angleDelta.y > 0)
                louder.running = true
            else
                quieter.running= true

            event.accepted = true
        }
    }

    Timer {
        id:         timerInterval
        interval:   500
        repeat:     true
        running:    true
        onTriggered: {
            get_volume.running = true
        }
    }


    Process {
        id: mute
        command: ["wpctl","set-mute","@DEFAULT_AUDIO_SINK@","toggle"]
    }
    
    Process {
        id: louder
        command: ["wpctl","set-volume","@DEFAULT_AUDIO_SINK@","5%+"]
    }

    Process {
        id: quieter
        command: ["wpctl","set-volume","@DEFAULT_AUDIO_SINK@","5%-"]
    }

    Process {
        id: get_volume
        command: ["wpctl","get-volume","@DEFAULT_AUDIO_SINK@"]

        stdout: StdioCollector {
            onStreamFinished: {
                const raw   = this.text.trim()
                const res   = raw.split(" ")

                const vol   = res[1]

                const mut   = res[2] === "[MUTED]"
                root.volume = vol
                root.muted  = mut
            }
        }
    }
}
