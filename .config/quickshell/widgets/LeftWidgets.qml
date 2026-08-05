import Quickshell
import Quickshell.Io
import QtQuick
import qs.singletons
import qs.themes
Row {
    x:          5
    id:         leftwidgets
    spacing:    Themes.gap[Themes.theme_number]

    property int custom_y:      (parent.implicitHeight - implicitHeight)/2+10
    BindMenuWidget{}
    Item{width:100}
    ThemeSwitcher{}
}
