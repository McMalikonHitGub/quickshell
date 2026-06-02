import Quickshell
import QtQuick

pragma Singleton

Singleton {
    property var bar:       Qt.rgba(0,0,0,0)
    property var blur:      Qt.rgba(0,255,0,0.15)
    property var border:    Qt.rgba(0,255,0,1)
    property var pending:   Qt.rgba(255,187,0,1)
    property var critical:  Qt.rgba(255,0,0,1)
    property var text:      Qt.rgba(255,255,255,1)
}
