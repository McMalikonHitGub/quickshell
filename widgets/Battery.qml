import Quickshell
import QtQuick
import qs.singletons
import qs.themes

TextWidget {
    id:             root
    inhalt:         hovered ? Power.timeremaining : "󰁹 " + Power.batteryPercent + "%"
    inhaltcolor:    Themes.textcolor[Themes.theme_number]
    color:          Themes.widgetcolor[Themes.theme_number]
    property var batteryfillcolor: Power.batteryPercent > 30 ? Themes.batterylow[Themes.theme_number] : (Power.batteryPercent > 15 ? Themes.batterymid[Themes.theme_number] : Themes.batterylow[Themes.theme_number])
    border.color: Themes.bordercolor[Themes.theme_number]
    Row{
        id:row
        x:3
        y:3
        spacing: 0
        Repeater{
            model: Power.batteryPercent
            Rectangle{
                height: root.height
                width: (root.width-5)/100
                color: Power.batteryPercent > 30 ? Themes.batteryfillcolor[Themes.theme_number] : (Power.batteryPercent > 15 ? Themes.batterymid[Themes.theme_number]  : Themes.batterylow[Themes.theme_number])
            }
        }
    }
}
 
