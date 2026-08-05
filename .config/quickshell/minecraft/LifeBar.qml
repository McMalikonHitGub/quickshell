import Quickshell
import QtQuick
import qs.widgets
import qs.themes 
import qs.singletons

Row {

    function powerToHearts(percentage) {
        return Math.floor(percentage/5)
    }
//
    function fullHeartNumber(hearts) {
        return Math.floor(hearts/2)
    }

    function existHalfHeart(hearts) {
        return hearts % 2 === 0
    }

    function emptyHeartNumber(hearts) {
        if (existHalfHeart(hearts))
        return 10 - fullHeartNumber(hearts) - 1 
        else
        return 10 - fullHeartNumber(hearts)
    }




    Repeater {
        id:fullhearts
        model: fullHeartNumber(powerToHearts(Power.batteryPercent))
        TextWidget {
            inhalt:"file:///home/malik/.config/quickshell/minecraft/icons/Heart_Full.png"
            inhaltcolor:Themes.barcolor[Themes.theme_number]
        }
    }
    TextWidget {
        id: halfheart
        inhalt:"file:///home/malik/.config/quickshell/minecraft/icons/Heart_Half.png"
        inhaltcolor:Themes.barcolor[Themes.theme_number]
        visible: existHalfHeart(powerToHearts(Power.batteryPercent))
    }
    Repeater {
        id:emptyhearts
        model: emptyHeartNumber(powerToHearts(Power.batteryPercent))
        TextWidget {
            inhalt:"file:///home/malik/.config/quickshell/minecraft/icons/Empty_Heart.png"
            inhaltcolor:Themes.barcolor[Themes.theme_number]
        }
    }
}
