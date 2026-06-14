import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.widgets
import qs.singletons
Scope {
    id:scop
    PanelWindow {
        id:bar
        color: Colors.bar
        margins{
            right: Globals.margins
            left: Globals.margins
            top: Globals.margins
            bottom: 0
        }
        anchors {
            top: true
            right: true
            left: true
        }
        implicitHeight: Globals.barheight
        WlogoutMenu{
            anchor.window:  bar
            pos: rightwid.wlogout_pos
        }
        //NetworkMenu{
         //   anchor.window: bar
         //   pos: rightwid.network_pos
        //}
        LeftWidgets{}
        Workspaces{anchors.centerIn: parent}
        RightWidgets{
            id:rightwid 
            x:position
        }
    }
}
