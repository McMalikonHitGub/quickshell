import Quickshell
import QtQuick
import qs.singletons

TextWidget {
    inhalt:         hovered ? "T(CPU)=" + CPU.tempC + "°C" :  "T(CPU)=" + CPU.tempK + "°K" 
    inhaltcolor:    Colors.text
}
