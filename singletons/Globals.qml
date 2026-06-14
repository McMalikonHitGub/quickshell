import Quickshell
import QtQuick

pragma Singleton

Singleton {
    property int barheight:     30
    property int margins:       5
    property int radius:        5
    property int borderwidth:   1
    property var font:          "Monocraft"
    property bool vis:          false
    property int wlogoutwidth:  30
    property int networkwidth:  80

    property bool sidebar_visible: true
    property int workspaceswidgetwidth: 300
}
