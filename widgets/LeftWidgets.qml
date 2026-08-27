import Quickshell
import Quickshell.Io
import QtQuick
import qs.singletons
import qs.themes
Row {
    x:          0
    id:         leftwidgets
    spacing:    Themes.gap[Themes.theme_number]

    property int custom_y:      (Themes.barheight - height)/2
    BindMenuWidget{id:  bindmenu}
    ThemeSwitcher{id:   theme}
    property int bindmenu_pos:  bindmenu.width
    property int theme_pos:     theme.width + bindmenu_pos
}
