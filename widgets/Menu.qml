import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.widgets
import qs.themes
import qs.minecraft
PanelWindow {
    id: floatingWindow

    anchors {
        top: true
        left: true
    }
    margins {
        left:1280/2 -floatingWindow.width/2
        top: 5
    }


    implicitWidth: 300
    implicitHeight: 150
    visible: shown
    color: "transparent"
    
    focusable: true

    WlrLayershell.keyboardFocus: WlrKeyboardFocus.OnDemand

    property bool shown: true
    
    property var placeholderModel: menus

    property list<var> menus: [
        {
            name: "Themes"
        },
        {
            name: "Programs",
            buttons: [
                {
                    name:       "Terminal",
                    command:    "kitty"
                },
                {
                    name:       "File Manager",
                    command:    "dolphin"
                },
                {
                    name:       "Browser",
                    command:    "firefox"
                },
                {
                    name:       "Obsidian",
                    command:    "obsidian"
                },
                {
                    name:       "Steam",
                    command:    "steam"
                },
                {
                    name:       "Spotify",
                    command:    "spotify-launcher"
                },
                {
                    name:       "Discord",
                    command:    "discord"
                },
                {
                    name:       "Inkscape",
                    command:    "inkscape"
                }
            ]

        },
        {
            name: "Network"
        }
    ]
    

    Column {
        id: rootmenu
        anchors.centerIn: parent
        Repeater {
            id: rep
            model: placeholderModel//floatingWindow.menus
            
            TextWidget {
                required property var modelData
                inhalt: modelData.name
                inhaltcolor: Themes.textcolor[Themes.theme_number]

                //skaling
                width: floatingWindow.width
                height: floatingWindow.height/rep.model.length
                
                Process {
                    id: proc 
                }
                function click() {
                        placeholderModel = modelData.buttons
                }
            }
        }
    }

    IpcHandler {
        target: "floatingWindow"

        function show(): void {
            floatingWindow.shown = true
        }

        function hide(): void {
            floatingWindow.shown = false
        }

        function toggle(): void {
            floatingWindow.shown = !floatingWindow.shown
        }
        function back(): void {
            placeholderModel = floatingWindow.menus
        }
    }
}
