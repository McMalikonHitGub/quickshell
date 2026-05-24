import Quickshell
import QtQuick
import "Globals.js" as Globals

Rectangle {
    HoverHandler {//liefert boolian
        id: mouse
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        cursorShape: Qt.PointingHandCursor
    }
    width:  mouse.hovered ? 105:100
    height: Globals.barheight
    border.color: Globals.defaultcolor
    border.width: mouse.hovered ? 2:1
    color: Globals.barcolor
    radius: 5
}
