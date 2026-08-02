import Quickshell
import Quickshell.Io
import QtQuick

import qs.widgets

PopupWindow {
    color:"green"
    implicitWidth: 500
    implicitHeight:500

    anchor.rect.x: 0
    visible: true
    Column{
        anchors.centerIn:parent
        TextWidget{
            inhalt: "test"
            inhaltcolor: "white"
        }
        TextWidget{
            inhalt: "test"
            inhaltcolor: "white"
        }
        TextWidget{
            inhalt: "test"
            inhaltcolor: "white"
        }
    }
}
