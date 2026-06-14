import Quickshell
import Quickshell.Io
import QtQuick
import qs.singletons
import qs.functions
import qs.wlogout

PopupWindow {
    id:root
    default property list<LogoutButton> buttons
    required property int pos
    anchor.rect.x: pos
    anchor.rect.y: Globals.barheight + 5
    implicitWidth:Globals.wlogoutwidth
    implicitHeight: Globals.vis ? col.height : 1
    visible: Globals.vis //implicitHeight > 1 ? true:false

    Behavior on implicitHeight {
        NumberAnimation {duration:500}
    }



    color: Colors.bar
    Rectangle {
        id:wlogoutscroll
        anchors.fill:parent
        border.color: Colors.bar
        color: Colors.bar
        height:col.height
        Column {
            id:col
            spacing: Globals.margins
            TextWidget{
                inhalt:""
                inhaltcolor: Colors.text
                width: Globals.wlogoutwidth
                color: hovered ? Colors.buttonHoverColor : Colors.buttonColor
                Process {
                    id: lock
                    running: false
                    command: ["hyprlock"]
                }
                function click() {
                    lock.running= true
                }
            }
            TextWidget{
                inhalt: "⏻"
                inhaltcolor: Colors.text
                width: Globals.wlogoutwidth
                color: hovered ? Colors.buttonHoverColor :Colors.buttonColor
                Process {
                    id: shutdown
                    running: false
                    command: ["shutdown","now"]
                }
                function click() {
                    shutdown.running= true
                }
            }
            TextWidget{
                inhalt: ""
                inhaltcolor: Colors.text
                width: Globals.wlogoutwidth
                color: hovered ? Colors.buttonHoverColor :Colors.buttonColor
                Process {
                    id: reboot
                    running: false
                    command: ["reboot"]
                }
                function click() {
                    reboot.running= true
                }
            }
        }
    }
}
