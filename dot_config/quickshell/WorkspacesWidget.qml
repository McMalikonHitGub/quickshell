import Quickshell
import QtQuick
import QtQuick.Layouts
import "Globals.js" as G

Rectangle {
    width:          180
    height:         G.barheight
    border.color:   G.defaultcolor
    border.width:   G.borderwidth
    color:          G.barcolor
    radius:         G.radius
    Workspaces {}
}
