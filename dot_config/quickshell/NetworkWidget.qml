import Quickshell
import QtQuick
import "Globals.js" as Globals

HoverWidget {
    Network {anchors.centerIn: parent}
    width:  mouse.hovered ? 55:50
}

