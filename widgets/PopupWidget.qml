import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import qs.widgets
import qs.singletons
import qs.themes

PopupWindow {
    id: root

    required property int pos

    property bool hovered: mouse.containsMouse
    default property alias content: contentItem.data

    function enter() {}
    function exit() {}
    function click() {}

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
    
    Item {
        id:         contentItem
        anchors.centerIn: parent
    }

    implicitWidth:  contentItem.childrenRect.width 
    implicitHeight: contentItem.childrenRect.height

    anchor.rect.x:  pos 
    anchor.rect.y:  Themes.barheight[Themes.theme_number]

    color:          mouse.containsMouse ? Themes.hovercolor[Themes.theme_number] : Themes.widgetcolor[Themes.theme_number]
}
