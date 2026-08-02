import Quickshell
import Quickshell.Io
import QtQuick
import qs.singletons
import qs.functions
import qs.themes

TextWidget {
    id: root
    inhaltcolor: Colors.text 
    inhalt: hovered ? Themes.unmute_icon[Themes.theme_number]:Themes.mute_icon[Themes.theme_number]
    function click() {
        if (root.inhalt == Themes.mute_icon[Themes.theme_number]) {
            root.inhalt = Themes.unmute_icon[Themes.theme_number];
        } else if (root.inhalt == Themes.unmute_icon[Themes.theme_number]) {
            root.inhalt = Themes.mute_icon[Themes.theme_number];
            

        }
    }

    Process {
        id: mute
        command: ["wpctl","set-mute","@DEFAULT_AUDIO_SINK@","toggle"]
    }
    
    Process {
        id: louder
        command: ["amixer","set","Master","5%+"]
    }
    Process {
        id: quieter
        command: ["amixer","set","Master","5%-"]
    }
    Process {
        id: get_volume
        command: ["amixer","get","Master","|","grep","-oP","'\[\d+%\]'"]
    }

    MouseArea {
    }
}
