import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import Quickshell.Hyprland
import qs.singletons
import qs.widgets


PanelWindow {
    id: root
    property bool run: false
    anchors {
        top: true
        left: true
        bottom: true
    }
    color: Colors.bar
    margins {
        right: Globals.margins - 5
        left: Globals.margins + 5
        top: Globals.margins + 5
        bottom: Globals.margins + 5
    }
    implicitWidth: Globals.sidebar_visible ? Globals.barheight + 50 : 0
    Column{
        spacing: Globals.margins
        Repeater {
            model: 9
            Widget {
                required property int index
                property var ws: Hyprland.workspaces.values.find(ws => ws.id === index + 1)
                property bool isActive: Hyprland.focusedWorkspace.id === (index + 1)
                property var windows: []

                Process {
                    id: proc 
                    running: true
                    command: ["hyprctl","clients","-j"]
                    stdout: StdioCollector {
                        onStreamFinished: {
                            const clients = JSON.parse(this.text);
                            console.log("total number of windows:", clients.length);
                            const wsClients = clients.filter(c => c.workspace.id === (index + 1));
                            console.log("Workspace :", index + 1,"Windows on this Workspace :", wsClients.length);
                            for (const client of wsClients) {
                                console.log(client.class);
                            }
                            const classes = wsClients.map(c => c.class);
                            console.log(classes);
                            windows = classes
                        }
                    }
                }
                inhalt: index+1
                inhaltcolor: Colors.text
                width: root.width
                visible: ws ? true : false
            }
        }
    }
}

