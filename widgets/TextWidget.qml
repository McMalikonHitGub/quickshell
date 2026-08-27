import Quickshell
import QtQuick
import qs.singletons
import qs.functions
import qs.themes

Rectangle {
    id: rect
    required property string    inhalt
    required property var       inhaltcolor
    property real imagewidth:   20
    property real imageheight:  20

    property bool hovered:      mouse.containsMouse      
    function enter() {}
    function exit() {}
    function click() {}

    implicitWidth:              image.visible ? image.width : (text.implicitWidth > Themes.barheight[Themes.theme_number] ? text.implicitWidth+ 10 : implicitHeight)
    implicitHeight:             image.visible ? image.height : Themes.barheight[Themes.theme_number]
    Behavior on width {
        NumberAnimation {duration:100}
    }
    MouseArea {
        id:                     mouse
        anchors.fill:           parent            
        acceptedButtons:        PointerDevice.Mouse | PointerDevice.TouchPad
        cursorShape:            Qt.PointingHandCursor
        hoverEnabled:           true
        onEntered:              { enter() }
        onExited:               { exit() }
        onClicked:              { click() }
    }

    Item {
        id:                     content
        anchors.fill:       parent

        implicitWidth:          image.visible ? image.implicitWidth     : text.implicitWidth
        implicitHeight:         image.visible ? image.implicitHeight    : text.implicitHeight


        Text {
            anchors.centerIn:   parent
            id:                 text
            visible:            !inhalt.endsWith(".png")
            font:               Themes.font[Themes.theme_number]
            color:              inhaltcolor
            text:               visible ? inhalt : ""
        }

        Image {
            anchors.centerIn:   parent
            id:                 image
            visible:            inhalt.endsWith(".png")
            source:             visible ? inhalt : ""
            width:              imagewidth
            height:             imageheight
            fillMode:           Image.PreserveAspectCrop
        }
    }
    border.color:               Themes.bordercolor[Themes.theme_number]
    border.width:               Themes.borderwidth[Themes.theme_number]
    color:                      mouse.containsMouse ? Themes.hovercolor[Themes.theme_number] : Themes.widgetcolor[Themes.theme_number]
    radius:                     Themes.radius[Themes.theme_number]
}
