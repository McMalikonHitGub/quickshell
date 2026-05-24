import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
RowLayout {
    anchors.fill: parent
    Layout.fillWidth: true
    anchors.margins: 5
    Repeater {//repeats {model}-times the following action
    model: 9
        //MouseArea {
            Text {
                property var ws: Hyprland.workspaces.values.find(ws => ws.id === index + 1)
                property bool isActive: Hyprland.focusedWorkspace.id === (index + 1)//isActive is working just fine
                property var fontsize: isActive ? 14:12
                text: isActive ? index+1 : (ws ? index+1:".")
                color: isActive ? "white" : (ws ? "lightgray" : "darkgray")
                font { pixelSize: fontsize ; bold: isActive }
            }
        }
    }
//}
