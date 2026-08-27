import Quickshell
import Quickshell.Io
import QtQuick

import qs.widgets
import qs.themes


PopupWindow {
    id: root
    required property int pos

    anchor.rect.x:   pos 
    anchor.rect.y:  0

    implicitHeight: col.height 
    implicitWidth:  col.width 

    visible: false
    color: Themes.workspaceinactivecolor[Themes.theme_number]

    Component.onCompleted: {
        console.log("initial y", y)
    }

    onYChanged: {
        console.log("new y", y)
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true

        onEntered: console.log("entered")
        onExited: {
            visTimer.stop()
            widget.vis = false
            console.log("exited")
        }

    }

    Column {
        anchors.centerIn:parent
        id: col
        spacing: 0
        Repeater {
            model: 9
            TextWidget {
                id: widget
                required property real index
                property bool vis
                inhalt: index+1
                inhaltcolor: Themes.textcolor[Themes.theme_number]
                visible: index === Themes.theme_number ? true : (mouse.containsMouse ? vis : false)
                
                //Connections {
                //    target:         mouse
                //    function onHoveredChanged() {
                //        if (mouse.containsMouse) {
                //            visTimer.restart()
                //        } else {
                //            visTimer.stop()
                //            vis =   false
                //        }
                //    }
               // }

                Timer {
                    id: visTimer
                    interval: widget.index*50
                    repeat: false
                    running: mouse.containsMouse
                    onTriggered: {
                        widget.vis = true
                    }
                }
            }
        }
    }
}
