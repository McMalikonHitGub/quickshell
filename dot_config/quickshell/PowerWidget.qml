import Quickshell
import QtQuick
import "Globals.js" as Globals

Rectangle {
    width:          50
    height:         Globals.barheight
    border.color:   Globals.defaultcolor
    border.width:   Globals.borderwidth
    color:          Globals.barcolor
    radius:         Globals.radius
    Power {
        anchors.centerIn: parent
        color:      Globals.textcolor
    }
}

