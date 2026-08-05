import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.singletons
import qs.themes
import qs.widgets
Row {
    id:                             root
    spacing:                        Themes.gap[Themes.theme_number]

    property var superworkspaces: [
        {
            name:       "Uni",
            workspaces: [1,2,3,4,5,6,7,8,9,10]
        },
        {
            name:       "Quickshell",
            workspaces: [11,12,13,14,15,16,17,18,19,20]
        },
        {
            name:       "hypr",
            workspaces: [21,22,23,24,25,26,27,28,29,30]
        },
        {
            name:       "Gaming",
            workspaces: [31,32,,33,34,35,36,37,38,39,40]
        }
    ]
    
    property real activesuperworkspace: 0
    Rectangle {
        id: r
        implicitWidth: row.width
        height: Themes.barheight[Themes.theme_number]
        color: "transparent"

        HoverHandler {
            id: mouse
            acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
            cursorShape: Qt.PointingHandCursor
        }

        Row {
            id:row
            Repeater {
                model: 4
                TextWidget {
                    required property real index
                    id: text
                    inhalt: superworkspaces[index].name
                    inhaltcolor: Themes.textcolor[Themes.theme_number]

                    function click() {
                        activesuperworkspace = index
                    }
                    
                    visible: index == activesuperworkspace ? true : mouse.hovered
                }
            }
        }
    }

    Repeater {//repeats {model}-times the following action
        model:                      superworkspaces[activesuperworkspace].workspaces
        ObjectWidget {
            id:                     w
            border.width:           Themes.borderwidth[Themes.theme_number]
            //implicitWidth:          contentRow.width + 10
            width:                  hovered ? implicitWidth + 10 :implicitWidth
            visible:                true//isActive ? true : (ws ? true : false )
            color:                  Themes.widgetcolor[Themes.theme_number]
            border.color:           Themes.bordercolor[Themes.theme_number]
            radius:                 Themes.radius[Themes.theme_number]
            required property int index
            property var ws:        Hyprland.workspaces.values.find(ws => ws.id === index + 1)
            property bool isActive: Hyprland.focusedWorkspace.id === (index + 1)

            //property var windows:       Hyprland.toplevels.values.filter(w => w.workspace?.id === index + 1)

            function windows() {
                Hyprland.refreshWorkspaces()
                return Hyprland.toplevels.values.filter(w => w.workspace?.id === index + 1)
            }
            
            Behavior on width {
                NumberAnimation {duration:100}
            }

            function click() {
                var cmd="workspace 11"
                console.log(cmd)
                Hyprland.dispatch(cmd)
            }

            Row {
                anchors.centerIn: parent
                id: contentRow
                spacing: 0
                Text {
                    text:   index+1
                    color:  w.isActive ? Themes.textcolor[Themes.theme_number] : Themes.workspaceinactivecolor[Themes.theme_number]
                    font.family:   Themes.font[Themes.theme_number]
                    font.pointSize: 8
                }
                Repeater {
                    model: w.windows()
                    delegate: Text {
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
