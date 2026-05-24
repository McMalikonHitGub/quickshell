import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "Globals.js" as Globals
RowLayout {
    anchors.centerIn:parent
    width:parent.width-20
    Layout.fillWidth: true
    Repeater {//repeats {model}-times the following action
        model: 9
        Rectangle{
            property var ws: Hyprland.workspaces.values.find(ws => ws.id === index + 1)
            property bool isActive: Hyprland.focusedWorkspace.id === (index + 1)
            width: 9
            height: Globals.barheight
            color: Globals.barcolor
            HoverHandler {
                id: mouse
                acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
                cursorShape: Qt.PointingHandCursor
            }
            MouseArea{
                cursorShape: Qt.PointingHandCursor
                anchors.fill:parent
                onClicked: (mouse)=> {
                    
                }
                Text {
                    anchors.centerIn:parent
                    color: Globals.textcolor
                    font {
                        pixelSize: isActive ? 16:12
                        family:Globals.font
                        bold:isActive
                    }
                    text: isActive ? index+1 : (ws ? index + 1: ".")
                }
            }
            radius: mouse.hovered ? Globals.hoverradius:Globals.radius
        }
    }
}

