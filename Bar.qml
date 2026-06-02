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
        PopupWindow {
            anchor.window:bar
            anchor.rect.x:bar.width - 100
            anchor.rect.y:wlo.height + 10
            implicitWidth:100
            implicitHeight: 50
            visible: true
            color: Colors.bar
            Widget {
                id:wlogoutscroll
                anchors.fill:parent
                inhalt:""
                inhaltcolor: Colors.text
                color: hovered ? "blue": Colors.bar
            }
        }
        margins{
            right: Globals.margins
            left: Globals.margins
            top: Globals.margins
            bottom: 0
        }
        color: Colors.bar
        anchors {
            top: true
            right: true
            left: true
        }
        implicitHeight: Globals.barheight
        LeftWidgets{}
        WorkspacesWidget {}
        RightWidgets{
            id:rightwid 
            x:position
        }
    }
}
