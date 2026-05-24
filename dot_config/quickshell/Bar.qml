import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "Globals.js" as G
Scope {

    PanelWindow {
        margins{
            right: G.margins
            left: G.margins
            top: G.margins
            bottom: G.margins
        }
        color: G.barcolor
        anchors {
            top: true
            right: true
            left: true
        }
        implicitHeight: G.barheight
        Row {
            x:5
            id:leftpanels
            spacing: G.margins
            HoverWidget {
                id :cputemp
                CPUtemp{anchors.centerIn: parent}
            }
            HoverWidget {
                id :cpuusage
                CPUusage { anchors.centerIn: parent}
            }
            HoverWidget {
                id: ramusage
                RAMusage { anchors.centerIn: parent}
            }
        }
        WorkspacesWidget {anchors.centerIn: parent}
        Row {
            id:rightpanels
            spacing: G.margins
            x:parent.width - pow.width - net.width - clo.width -sus.width - 20
            HoverWidget {
                id:pow 
                Power{anchors.centerIn: parent}
            }
            HoverWidget {
                id:net 
                Network{anchors.centerIn: parent}
            }
            HoverWidget {
                id: clo
                Clock{anchors.centerIn:parent}
            }
            HoverWidget {
                id: sus
                Suspend {
                    anchors.centerIn:parent}
            }
        }
    }
}
