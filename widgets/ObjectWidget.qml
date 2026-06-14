import Quickshell
import QtQuick
import qs.singletons
import qs.functions

Rectangle {
    id: rect
    property bool hovered:  mouse.containsMouse      
    function enter() {}
    function exit() {}
    function click() {}
    
    default property alias content: contentItem.data

    Item {
        id: contentItem
        anchors.centerIn: parent
    }

    implicitWidth: contentItem.childrenRect.width
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
    border.color: Colors.border
    border.width: mouse.containsMouse ? 1:1
    color: mouse.containsMouse ? Colors.blur : Colors.bar
    radius: Globals.radius
}
