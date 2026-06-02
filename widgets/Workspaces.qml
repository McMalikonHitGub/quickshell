import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.singletons
RowLayout {
    id: rowlayout
    width: parent.width-20
    Repeater {//repeats {model}-times the following action
        model: 9
        Rectangle{
            property var ws: Hyprland.workspaces.values.find(ws => ws.id === index + 1)
            property bool isActive: Hyprland.focusedWorkspace.id === (index + 1)
            width: 9
            height: Globals.barheight
            color: Colors.bar
            Text {
                anchors.centerIn:parent
                color:Colors.text
                font {
                    pixelSize: isActive ? 16:12
                    family:Globals.font
                    bold:isActive
                }
                text: isActive ? index+1 : (ws ? index + 1: "_")
                }
            radius: 0
        }
    }
}

