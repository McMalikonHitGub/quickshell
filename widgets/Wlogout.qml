import Quickshell
import Quickshell.Hyprland
import QtQuick
import Quickshell.Io
import qs.singletons
import qs.themes

Rectangle {
    id: root

    width: hardwidth
    height:Themes.barheight[Themes.theme_number]
    color: "transparent"
    
    HoverHandler {
        id: mouse
    }

    property int hardwidth: Themes.barheight[Themes.theme_number]*buttons.length

    property bool buttonsvisible: mouse.hovered

    property var buttons: [
        {
            name: Themes.hyprlock_icon[Themes.theme_number],
            command: ["hyprlock"]
        },
        {
            name: Themes.shutdown_icon[Themes.theme_number],
            command: ["shutdown","now"]
        },
        {
            name: Themes.reboot_icon[Themes.theme_number],
            command: ["reboot"]
        }
    ]


    Row {
        id:r
        spacing: Themes.gap[Themes.theme_number]
        TextWidget {
            inhalt:         "wlogout"
            inhaltcolor:    Themes.textcolor[Themes.theme_number]
            visible:        buttonsvisible ? false : true
            width:          hardwidth + Themes.gap[Themes.theme_number]*(buttons.length - 1)
        }

        Repeater {
            model:              root.buttons
            TextWidget {
                width:          hardwidth/3
                required property var modelData
                visible:        buttonsvisible
                inhalt:         modelData.name
                inhaltcolor:    Themes.textcolor[Themes.theme_number]
                

                function click() {
                    c.running = true
                }

                Process {
                    id: c 
                    command:modelData.command
                }
            }
        }
    }
}
