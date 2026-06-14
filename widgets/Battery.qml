import Quickshell
import QtQuick
import qs.singletons

TextWidget {
    id:root
    inhalt:   hovered ? Power.timeremaining : "Battery at: " + Power.batteryPercent + "%"
    inhaltcolor:    Colors.text
    color: Colors.bar
    property var batteryfillcolor: Power.batteryPercent > 30 ? Colors.blur : (Power.batteryPercent > 15 ? Colors.batterymid : Colors.batterylow)
    border.color: Power.batteryPercent > 30 ? Colors.border : (Power.batteryPercent > 15 ? "yellow" : "red");
    Row{
        id:row
        x:3
        y:3
        spacing: 0
        Repeater{
            model: Power.batteryPercent
            Rectangle{
                height: 24
                width: (root.width-5)/100
                color: batteryfillcolor
            }
        }
    }
}
 
