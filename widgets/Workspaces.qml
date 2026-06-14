import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.singletons
Row {
    id: root
    spacing: Globals.margins
    Repeater {//repeats {model}-times the following action
        model: 9
        ObjectWidget {
            id:w
            border.color:               "red"
            border.width: 0
            implicitWidth: contentRow.width + 10
            visible: isActive ? true : (ws ? true : false)
            color: isActive ? Colors.workspaceactive : Colors.bar
            required property int index
            property var ws:            Hyprland.workspaces.values.find(ws => ws.id === index + 1)
            property bool isActive:     Hyprland.focusedWorkspace.id === (index + 1)
            property var windows:       Hyprland.toplevels.values.filter(w => w.workspace?.id === index + 1)

            Row {
                anchors.centerIn: parent
                id: contentRow
                spacing: 1
                Repeater {
                    model: windows
                    delegate: Text {
                        required property var modelData
                        property string appClass: modelData.lastIpcObject.class

                        function iconFor(title) {
                            const t = title.toLowerCase();
                            if (t.includes("firefox"))
                                return "󰈹";
                            if (t.includes("nvim") || t.includes("vim"))
                                return "";
                            if (t.includes("vesktop") || t.includes("discord"))
                                return "";
                            if (t.includes("spotify"))
                                return "";
                            if (t.includes("vs"))
                                return "";
                            return "󰣆";
                        }

                        Component.onCompleted: {
                            console.log(Hyprland.dispatch.toString())
                            console.log(typeof Hyprland.dispatch)
                            console.log(Object.keys(Hyprland));
                            console.log(Hyprland.dsp);
                        }
                        text: iconFor(modelData.title)
                        color: Colors.text
                    }
                }
            }
        }
    }
}
