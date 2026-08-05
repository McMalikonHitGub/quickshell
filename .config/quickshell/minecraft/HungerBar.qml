import Quickshell
import QtQuick
import qs.widgets
import qs.themes

Row {
    Repeater {
        model: 10
        TextWidget {
            inhalt:"file:///home/malik/.config/quickshell/minecraft/icons/Food_Full.png"
            inhaltcolor:Themes.barcolor[Themes.theme_number]
        }
    }
}
