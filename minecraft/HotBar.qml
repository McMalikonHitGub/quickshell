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
    Repeater {
        model: 9
        TextWidget {
            inhalt: isActive ? "file:///home/malik/.config/quickshell/minecraft/icons/Slot_Craftable.png" : "file:///home/malik/.config/quickshell/minecraft/icons/Slot.png"
            inhaltcolor:Themes.barcolor[Themes.theme_number]
            imageheight:50
            imagewidth:50


            required property int index
            property var ws:            Hyprland.workspaces.values.find(ws => ws.id === index + 1)
            property bool isActive:     Hyprland.focusedWorkspace.id === (index + 1)
            property var windows:       Hyprland.toplevels.values.filter(w => w.workspace?.id === index + 1)

            function click() {
                if (ws)
                    ws.activate()
            }

            GridLayout {
                Repeater {
                    model: windows
                    Image {
                        function imageForProgram(program) {
                            function iconFor(title) {
                            const t = title.toLowerCase();
                            if (t.includes("kitty"))
                                return ;
                            if (t.includes("dolphin"))
                                return ;
                            if (t.includes("firefox"))
                                return ;
                            if (t.includes("nvim"))
                                return ;
                            if (t.includes("discord"))
                                return ;
                            if (t.includes("spotify"))
                                return ;
                            if (t.includes("steam"))
                                return ;
                            return ;
                            }
                        }

                        required property var modelData
                        property string appClass: modelData.lastIpcObject.class 

                        source: imageForProgram(appClass)
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }
        }
    }
}

