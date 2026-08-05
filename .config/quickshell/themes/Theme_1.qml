import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import qs.widgets
import qs.singletons

PanelWindow {
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: Qt.rgba(0.15, 0.15, 0.15, 1) // oben
            }
            GradientStop {
                position: 1.0
                color: Qt.rgba(0.15, 0.15, 0.15, 0.0) // unten
            }
        }
    }
    id:bar
    color: Colors.bar
    margins{
        right: 0
        left: 0
        top: 0
        bottom: 0
    }
    anchors {
        top: Themes.theme_number === 1 ? false : true
        right: true
        left: true
        bottom: Themes.theme_number === 1 ? true : false
    }
    implicitHeight: Themes.barheight[Themes.theme_number]
    WlogoutMenu{
        anchor.window:  bar
        pos: rightwid.wlogout_pos
    }
    NetworkMenu{
        anchor.window: bar
        pos: rightwid.network_pos
    }
    LeftWidgets{
        y: rightwid.custom_y
    }
    SuperWorkspaces{anchors.centerIn: parent}
    RightWidgets{
        id:rightwid 
        x: custom_x
        y: custom_y
    }
}
