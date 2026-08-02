import Quickshell
import QtQuick
import qs.widgets
import qs.themes
import qs.singletons
Rectangle {
    id:root
    height: Themes.barheight[Themes.theme_number]
    width: row.width
    color: "transparent"
    HoverHandler {
        id: mouse
    }//
    Behavior on width {
        NumberAnimation{duration:500}
    }
    Row {
        id:row
        Repeater {
            model: 9//Themes.themes_icons.length
            TextWidget {
                id:widget
                required property real index
                property bool vis
                Connections {
                    target: mouse
                    function onHoveredChanged() {
                        if (!mouse.hovered)
                            widget.vis = false
                    }
                }
                Timer {
                    id: visTimer
                    interval: widget.index*50
                    repeat: false
                    running: mouse.hovered
                    onTriggered: {
                        widget.vis = true
                    }
                }
                visible: index === Themes.theme_number ? true : (mouse.hovered ? vis : false)
                inhalt: Themes.theme_number === 2 ? "file:///home/malik/.config/quickshell/minecraft/icons/Advancement_Task_Frame_Unobtained.png" : Themes.themes_icons[index]
                inhaltcolor: Themes.textcolor[Themes.theme_number]

                imagewidth: Themes.bindmenuwidgetheight[Themes.theme_number]
                imageheight: Themes.bindmenuwidgetheight[Themes.theme_number]
                Text {
                    anchors.centerIn:   parent
                    id:                 text
                    visible:            Themes.theme_number === 2 && !Themes.themes_icons[index].endsWith(".png")
                    font:               Globals.font
                    color:              widget.inhaltcolor
                    text:               visible ? Themes.themes_icons[widget.index]
 : ""
                }

                Image {
                    anchors.centerIn:   parent
                    id:                 image
                    visible:            Themes.theme_number === 2 && Themes.themes_icons[index].endsWith(".png")

                    source:             visible ? Themes.themes_icons[widget.index] : ""
                    width:              widget.imagewidth
                    height:             widget.imageheight
                    fillMode:           Image.PreserveAspectCrop
                }

                function click() {
                    Themes.theme_number = index
                }
            }
        }
    }
}
