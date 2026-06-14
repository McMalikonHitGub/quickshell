import Quickshell
import QtQuick
import qs.singletons
import qs.functions

Rectangle {
    id: rect
    required property string inhalt
    required property var inhaltcolor
    property bool hovered:  mouse.containsMouse      
    function enter() {}
    function exit() {}
    function click() {}

    implicitWidth: text.implicitWidth + 10
    implicitHeight: Globals.barheight

    MouseArea {
        id:                 mouse
        anchors.fill:       parent            
        acceptedButtons:    PointerDevice.Mouse | PointerDevice.TouchPad
        cursorShape:        Qt.PointingHandCursor
        hoverEnabled:       true
        onEntered: { enter() }
        onExited: { exit() }
        onClicked: { click() }
    }
    Text {
        id: text
        anchors.centerIn: parent
        font: Globals.font
        color: inhaltcolor
        text: inhalt
    }
    border.color: Colors.border
    border.width: mouse.containsMouse ? 1:1
    color: mouse.containsMouse ? Colors.blur : Colors.bar
    radius: Globals.radius
}
