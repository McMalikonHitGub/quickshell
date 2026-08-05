import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.themes 
import qs.widgets

PanelWindow {
    id:root
    color: Themes.barcolor[Themes.theme_number]
    anchors {
        top:    false
        right:  true
        left:   true
        bottom: true
    }
    Column {
        spacing:10
        BindMenuWidget{}
        ThemeSwitcher{}
    }

    Column {
        ArmorBar{
            id:armor 
            x:hot.x
        }
        Row{
            id:row
            x:hot.x
            spacing: hot.implicitWidth - life.implicitWidth  - hunger.implicitWidth 
            LifeBar{
                id: life 
            }
            HungerBar{
                id: hunger
            }
        }
        HotBar{
            id:hot 
            x:(root.width-width)/2
        }
    }
    McEscapeMenu{}
    Column {
        x: root.width-width
        Row{Charging{}}
        Row{}
    }
}
