import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import Quickshell.Io 
import QtQuick
import QtQuick.Layouts

import qs.themes
import qs.functions

Row {
    id: root
    spacing: Themes.gap[Themes.theme_number]
    anchors.centerIn: parent

    property var superworkspaces: [
        {
            name: "Uni",
            workspaces: [1,2,3,4,5,6,7,8,9,10]
        },
        {
            name:       "Quickshell",
            workspaces: [11,12,13,14,15,16,17,18,19,20]
        },
        {
            name:       "Gaming",
            workspaces: [21,22,23,24,25,26,27,28,29,30]
        }
    ]

    property real activesuperworkspace: 0

    Rectangle {
        id: rectangleSuperWorkspaceSwitcher
        implicitWidth: superWorkspaceRow.width 
        height: Themes.barheight[Themes.theme_number]
        color: "transparent"

        HoverHandler {
            id: mouse
        }


        Row {
            id: superWorkspaceRow
            anchors.centerIn:parent
            Repeater {
                model: superworkspaces
                TextWidget {
                    required property real index
                    required property var modelData

                    id: superTextWidget
                    inhalt: modelData.name
                    inhaltcolor: Themes.textcolor[Themes.theme_number]

                    function click() {
                        activesuperworkspace = index
                    }

                    visible: index == activesuperworkspace ? true : mouse.hovered

                    Behavior on visible {
                        NumberAnimation {
                            duration: 200
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        implicitWidth:  workspaceRow.width
        height:         Themes.barheight[Themes.theme_number]
        color: "transparent"
        Row {
            id: workspaceRow
            anchors.centerIn:parent
        Repeater {
            model: superworkspaces[activesuperworkspace].workspaces
            ObjectWidget {
                id: w
                required property var modelData

                width:          hovered ? implicitWidth + 10 : implicitWidth
                visible:        true 

                Behavior on width {
                    NumberAnimation {
                        duration: 100
                    }
                }

                property bool isActive: Hyprland.focusedWorkspace.id === modelData


                function windows() {
                    Hyprland.refreshWorkspaces()
                    return Hyprland.toplevels.values.filter(w => w.workspace?.id === modelData)
                }

                function click() {
                    switchtows.running = true
                }

                Process {
                    id: switchtows
                    running: false
                    command: ["hyprctl","eval","hl.dispatch(hl.dsp.focus({ workspace =",modelData," }))"]
                }

                Row {
                    anchors.centerIn: parent
                    Text {
                        id: lol
                        text: modelData
                        color: w.isActive ? Themes.textcolor[Themes.theme_number] : Themes.workspaceinactivecolor[Themes.theme_number]
                        font.family: Themes.font[Themes.theme_number]
                    }
                    Repeater {
                        model: w.windows()
                        Text {
                            required property var modelData
                            property string appClass: modelData.title


                            function iconFor(title) {
                                const t = title.toLowerCase();
                                if (t.includes("~"))
                                    return Themes.kitty_icon[Themes.theme_number];
                                if (t.includes("dolphin"))
                                    return Themes.filemanager_icon[Themes.theme_number];
                                if (t.includes("firefox"))
                                    return Themes.firefox_icon[Themes.theme_number];
                                if (t.includes("nvim"))
                                    return Themes.vim_icon[Themes.theme_number];
                                if (t.includes("discord"))
                                    return Themes.discord_icon[Themes.theme_number];
                                if (t.includes("spotify"))
                                    return Themes.spotify_icon[Themes.theme_number];
                                if (t.includes("steam"))
                                    return Themes.steam_icon[Themes.theme_number];

                                if (t.includes(".pdf"))
                                    if (t.includes("zathura"))
                                        return "󰬇";
                                    else
                                        return "";

                                if (t.includes("qs")) 
                                    return ("󰫾");
                                return "";
                            }

                        
                            function colorFor(title) {
                                const t = title.toLowerCase();
                                if (t.includes("~"))
                                    return "lightblue";
                                if (t.includes("dolphin"))
                                    return "white";
                                if (t.includes("firefox"))
                                    return "orange";
                                if (t.includes("nvim"))
                                    return "blue";
                                if (t.includes("discord"))
                                    return "white";
                                if (t.includes("spotify"))
                                    return "green";
                                if (t.includes("steam"))
                                    return "blue";
                                if (t.includes(".pdf"))
                                    if (t.includes("zathura"))
                                        return "white";
                                    else
                                        return "red";

                                if (t.includes("qs")) 
                                    return ("lightgreen")

                                return "white";
                            }


                            text: iconFor(appClass)
                            color: w.isActive ? colorFor(appClass) : Themes.workspaceinactivecolor[Themes.theme_number]
                            font.pointSize: 10
                        }
                    }
                }
            }
        }
    }
}
}
