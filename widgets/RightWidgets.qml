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

    property int wlogout_pos: position+wlo.x
    property int network_pos: position+net.x
    //Component.onCompleted: print(wlo.childrenRect)
    //Component.onCompleted: print(wlo.x)

}
