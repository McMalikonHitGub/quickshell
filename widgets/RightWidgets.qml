import Quickshell
import QtQuick
import qs.singletons

Row {
    spacing:    Globals.margins
    Battery{id:bat}
    Network{id:net}
    Clock{id:clo}
    Wlogout{id:wlo}
    property real position: parent.width - bat.width - net.width - clo.width - wlo.width - 20
    Component.onCompleted: print(bat.childrenRect)

}
