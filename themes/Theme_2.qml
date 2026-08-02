import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.widgets

PanelWindow{
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: Qt.rgba(1, 0, 1, 1)
            }
            GradientStop {
                position: 1.0
                color: "transparent"//Qt.rgba(1, 0, 1, 0)
            }
        }
    }

    id:bar
    color: Themes.barcolor[Themes.theme_number]
    implicitHeight: Themes.barheight[Themes.theme_number]

    margins{
        right: 0
        left: 0
        top: 0
        bottom: 0
    }

    anchors {
        top:    true
        left:   true
        right:  true
        bottom: false
    }
    LeftWidgets{
        y: rightwid.custom_y

    }
    Workspaces{anchors.centerIn: parent}
    RightWidgets{
        id:rightwid 
        x: custom_x
        y: custom_y
    }
}
