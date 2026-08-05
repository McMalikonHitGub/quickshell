import Quickshell
import QtQuick
import qs.widgets
import qs.themes

Row {
    Repeater {
        model: 9
        TextWidget {
            inhalt:"file:///home/malik/.config/quickshell/minecraft/icons/Armor_Empty.png"
            inhaltcolor:Themes.barcolor[Themes.theme_number]
        }
    }
}
