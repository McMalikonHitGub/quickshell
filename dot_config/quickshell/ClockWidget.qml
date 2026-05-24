import Quickshell
import QtQuick
import "Globals.js" as Globals 
Rectangle {
    HoverHandler {//liefert boolian
        id: mouse
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        cursorShape: Qt.PointingHandCursor
    }
    width: mouse.hovered ? 105:100
    height: Globals.barheight
    border.width: mouse.hovered ? Globals.borderwidth + 1 : Globals.borderwidth
    border.color: Globals.defaultcolor
    color: Globals.barcolor
    radius: mouse.hovered ? 0:5
    Clock {
        anchors.centerIn: parent
        color: Globals.textcolor
    }
}
