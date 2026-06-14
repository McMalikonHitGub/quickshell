import Quickshell
import QtQuick

pragma Singleton

Singleton {
    property var bar:               Qt.rgba(0,0,0,0)
    property var blur:              Qt.rgba(10,10,10,0.15)
    property var border:            Qt.rgba(0,255,255,0.3)
    property var pending:           Qt.rgba(255,187,0,1)
    property var critical:          Qt.rgba(255,0,0,1)
    property var text:              Qt.rgba(255,255,255,1)
    property var buttonColor:       "5C5C5C"
    property var buttonHoverColor:  Qt.rgba(150,0,0,0.5)
    property var workspaceactive:   Qt.rgba(10,10,10,0.2)

    property var batterymid:        Qt.rgba(255,255,0,0.15)
    property var batterylow:        Qt.rgba(255,0,0,0.15)
}
