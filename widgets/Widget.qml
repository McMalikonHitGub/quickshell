import Quickshell
import QtQuick
import qs.singletons

Rectangle {
    id: rect
    required property var inhalt
    required property var inhaltcolor

    property bool hovered: mouse.containsMouse
    MouseArea {
        id:                 mouse
        anchors.fill:       parent            
        acceptedButtons:    PointerDevice.Mouse | PointerDevice.TouchPad
        cursorShape:        Qt.PointingHandCursor
        hoverEnabled:       true
    }
    Text {
        anchors.centerIn: parent
        id: text
        font: Globals.font
        color: inhaltcolor
        text: inhalt
    }
    width:  text.width + 15
    height: Globals.barheight
    border.color: Colors.border
    border.width: mouse.containsMouse ? 2:1
    color: mouse.containsMouse ? Colors.blur : Colors.bar
    radius: 15
}
