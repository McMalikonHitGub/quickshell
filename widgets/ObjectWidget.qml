import Quickshell
import QtQuick
import qs.singletons
import qs.functions
import qs.themes

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

    implicitWidth: contentItem.childrenRect.width + 10 < implicitHeight ? implicitHeight : contentItem.childrenRect.width + 10
    implicitHeight: Themes.barheight[Themes.theme_number]

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
    border.color: Themes.bordercolor[Themes.theme_number]
    border.width: Themes.borderwidth[Themes.theme_number]
    color: mouse.containsMouse ? Themes.hovercolor[Themes.theme_number] : Themes.widgetcolor[Themes.theme_number]
    radius: Themes.radius[Themes.theme_number]
}
