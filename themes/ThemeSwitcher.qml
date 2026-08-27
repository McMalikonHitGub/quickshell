import Quickshell
import QtQuick
import qs.widgets
import qs.themes
import qs.singletons
TextWidget {
    inhalt: Themes.theme_number 
    inhaltcolor: Themes.textcolor[Themes.theme_number]
    visible: false//!Themes.thememenu_vis

    function enter() {
        Themes.thememenu_vis = true
    }
}
