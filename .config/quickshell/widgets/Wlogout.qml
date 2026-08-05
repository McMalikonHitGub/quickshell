import Quickshell
import Quickshell.Hyprland
import QtQuick
import qs.singletons
import qs.themes

TextWidget {
    id:             wlogoutwidget
    inhalt:         Themes.wlogoutwidget_is_x ? Themes.x_icon[Themes.theme_number] : Themes.wlogoutwidget_icon[Themes.theme_number]
    inhaltcolor:    Colors.text
    color:          Themes.wlogoutwidget_is_x ? "red"     : Colors.bar
    visible:        true
    width:          Themes.wlogoutwidth[Themes.theme_number]
    Timer {
        id: visTimer
        interval: 500
        repeat: false
        onTriggered: {
            Themes.wlogoutmenu_vis = false
        }
    }

    function click() {
        if (Themes.wlogoutwidget_is_x) {
            visTimer.restart()
            Themes.wlogoutwidget_is_x   =false
        } else {
            Themes.wlogoutwidget_is_x   = true
            Themes.wlogoutmenu_vis      = true
        }
    }
}
