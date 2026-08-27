import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Window
import QtQuick.Controls

import qs.singletons
import qs.themes
import qs.widgets

Rectangle {
    id:root
    height: Themes.bindmenuwidgetheight[Themes.theme_number]
    width: row.width
    color: "transparent"
    HoverHandler {
        id: mouse
    }

    property var programs: [
        {
            program:    "kitty",
            icon:       Themes.kitty_icon[Themes.theme_number],
            color:      "lightblue"
        },
        {
            program:    "dolphin",
            icon:       Themes.filemanager_icon[Themes.theme_number],
            color:      "white"
        },
        {
            program:    "firefox",
            icon:       Themes.firefox_icon[Themes.theme_number],
            color:      "orange"
        },
        {
            program:    "obsidian",
            icon:       Themes.obsidian_icon[Themes.theme_number],
            color:      "purple"
        },
        {
            program:    "steam",
            icon:       Themes.steam_icon[Themes.theme_number],
            color:      "blue"
        },
        {
            program:    "spotify-launcher",
            icon:       Themes.spotify_icon[Themes.theme_number],
            color:      "green"
        },
        {
            program:    "discord",
            icon:       "",
            color:      "lightblue"
        },
        {
            program:    "inkscape",
            icon:       "",
            color:      "white"
        }
    ]
    Row {
        id: row
        property bool extended

        spacing: Themes.gap[Themes.theme_number]

        TextWidget {
            visible: true
            inhalt: Themes.bindmenu_icon[Themes.theme_number]
            inhaltcolor: Themes.textcolor[Themes.theme_number]
            imagewidth: Themes.bindmenuwidgetheight[Themes.theme_number]
            imageheight: Themes.bindmenuwidgetheight[Themes.theme_number]
        }

        Repeater {
            model:                  root.programs
            TextWidget {
                required property var modelData
                required property real index
                property bool vis
                inhalt:             modelData.icon
                inhaltcolor:        modelData.color

                imagewidth:         Themes.bindmenuwidgetheight[Themes.theme_number]
                imageheight:        Themes.bindmenuwidgetheight[Themes.theme_number]

                visible:            mouse.hovered ? vis : false

                function click() {
                    proc.command =  [modelData.program]
                    proc.running =  true
                }
                
                Connections {
                    target:         mouse
                    function onHoveredChanged() {
                        if (mouse.hovered) {
                            visTimer.restart()
                        } else {
                            visTimer.stop()
                            vis =   false
                        }
                    }
                }

                Timer {
                    id:             visTimer
                    interval:       index*50
                    repeat:         false
                    running:        mouse.hovered
                    onTriggered: {
                        vis =       true
                    }
                }

                Behavior on width {
                    NumberAnimation {duration:100}
                }
                Process {
                    id:proc
                }
            }
        }
    }
}

