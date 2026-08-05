import Quickshell
import QtQuick
import Quickshell.Io 
import qs.singletons
import qs.themes
TextWidget{
    id:             root
    inhaltcolor:    Colors.text
    inhalt:         Themes.networkwidget_is_x ? Themes.x_icon[Themes.theme_number] : Themes.network_icon[Themes.theme_number]

    Timer {
        id: networkvisTimer
        interval: 500
        repeat: false
        onTriggered: {
            Themes.networkmenu_vis = false
        }
    }

    function click() {
        if (Themes.networkwidget_is_x) {
            networkvisTimer.restart()
            Themes.networkwidget_is_x   = false
            Themes.networkscan          = false
        } else {
            Themes.networkwidget_is_x   = true
            Themes.networkmenu_vis      = true
            Themes.networkscan          = true
        }
    }
}



