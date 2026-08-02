import Quickshell
import Quickshell.Io
import QtQuick

import qs.singletons
import qs.functions
import qs.wlogout
import qs.themes

PopupWindow {
    id:root
    default property list<LogoutButton> buttons
    required property int pos
    anchor.rect.x: pos
    anchor.rect.y: Themes.barheight[Themes.theme_number] + 10
    implicitWidth:Themes.wlogoutwidth[Themes.theme_number]
    implicitHeight: Themes.wlogoutwidget_is_x ? col.height : 1
    visible: Themes.wlogoutmenu_vis

    Behavior on implicitHeight {
        NumberAnimation {duration:500}
    }



    color: Colors.bar
    Rectangle {
        id:                 wlogoutscroll
        anchors.fill:       parent
        border.color:       Colors.bar
        color:              Colors.bar
        height:             col.height
        Column {
            id:             col
            spacing:        Themes.gap[Themes.theme_number]
            Timer {
                id:         visTimer
                interval:   500
                repeat:     false
                onTriggered: {
                    Themes.wlogoutmenu_vis =    false
                }
            }
            TextWidget{
                inhalt:     ""
                inhaltcolor: Colors.text
                width:      Themes.wlogoutwidth[Themes.theme_number]
                color:      hovered ? Colors.buttonHoverColor : Colors.buttonColor
                Process {
                    id: lock
                    running: false
                    command: ["hyprlock"]
                }
                Timer {
                    id: lockTimer
                    interval: 500
                    repeat: false
                    onTriggered: {
                        lock.running=true
                    }
                }

                function click() {
                    Themes.wlogoutwidget_is_x = false
                    visTimer.restart()
                    lockTimer.restart()
                }
            }
            TextWidget{
                inhalt: "⏻"
                inhaltcolor: Colors.text
                width: Themes.wlogoutwidth[Themes.theme_number]
                color: hovered ? Colors.buttonHoverColor :Colors.buttonColor
                Timer {
                    id: shutdownTimer
                    interval: 500
                    repeat: false
                    onTriggered: {
                        shutdown.running=true
                    }
                }

                Process {
                    id: shutdown
                    running: false
                    command: ["shutdown","now"]
                }
                function click() {
                    Themes.wlogoutwidget_is_x = false
                    visTimer.restart()
                    shutdownTimer.restart()
                }
            }
            TextWidget{
                inhalt: ""
                inhaltcolor: Colors.text
                width: Themes.wlogoutwidth[Themes.theme_number]
                color: hovered ? Colors.buttonHoverColor :Colors.buttonColor
                Timer {
                    id: rebootTimer
                    interval: 500
                    repeat: false
                    onTriggered: {
                        reboot.running=true
                    }
                }

                Process {
                    id: reboot
                    running: false
                    command: ["reboot"]
                }
                function click() {
                    Themes.wlogoutwidget_is_x = false
                    visTimer.restart()
                    rebootTimer.restart()
                }
            }
        }
    }
}
