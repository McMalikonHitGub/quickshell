import Quickshell
import QtQuick
import qs.singletons
Row {
    x:          5
    id:         leftwidgets
    spacing:    Globals.margins
    CPUtempWidget{}
    CPUusageWidget{}
    RAMusageWidget{}
}
