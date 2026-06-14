import Quickshell
import Quickshell.Hyprland
import QtQuick
import qs.singletons

TextWidget {
    id:             wlogoutwidget
    inhalt:         Globals.vis ? ""    : ""
    inhaltcolor:    Colors.text
    color:          Globals.vis ? "red"     : Colors.bar
    visible:        true
    width: Globals.wlogoutwidth
    function enter() {
        Globals.vis=true
    }
    function click()  {
        Globals.vis= false
    }
}
