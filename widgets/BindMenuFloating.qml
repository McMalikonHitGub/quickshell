import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import qs.widgets
import qs.singletons
import qs.themes

PopupWidget {
    Row {
        Repeater {
            model: 5
            TextWidget {
                inhalt: "test"
                inhaltcolor: Themes.textcolor[Themes.theme_number]
            }
        }
    }
}
