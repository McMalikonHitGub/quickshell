import Quickshell
import Quickshell.Io
import QtQuick
import qs.singletons
import qs.functions
import qs.wlogout

PopupWindow {
    id:root
    required property int pos
    anchor.rect.x: pos
    anchor.rect.y: Globals.barheight + 10
    implicitWidth: childrenRect.implicitWidth
    implicitHeight: Globals.bindsmenuvis ? col.height : 1
    visible: Globals.bindsmenuvis
    
    property list<string> binds: [
        " + Q = ",
        " + C = ",
        " + E = ",
        " + V = 󱂬",
        " + O = 󰇈",
        " + P = 󰡍",
        " + J = ",
        " + B = 󰈹"
    ]

    Behavior on implicitHeight {
        NumberAnimation {duration:500}
    }
    color: Colors.bar
    ObjectWidget {
        id:bindsmenu
        border.color: Colors.border
        color: Colors.buttonColor
        implicitHeight:col.height
        Column {
            id:col
            anchors.centerIn: parent
            Repeater {
                model: root.binds.length
                Text {
                    required property real index
                    text: root.binds[index]
                    color: Colors.text
                }
            }
        }
    }
}
