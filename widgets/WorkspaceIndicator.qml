import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import qs.themes

ShellRoot {
    Variants {
        model: Quickshell.screens

PanelWindow {
    id: floatingWindow
    required property var modelData
    screen: modelData

    anchors {
        right:      true
        bottom:     true
    }

    margins {
        right:      Themes.barheight[Themes.theme_number]
        bottom:     Themes.barheight[Themes.theme_number]
    }

    implicitWidth:  50
    implicitHeight: 50


    color: "transparent"

    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

    mask: Region{}
    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: 0.3
        border.width: Themes.borderwidth[Themes.theme_number]
        border.color: Themes.bordercolor[Themes.theme_number]
        radius: Themes.radius[Themes.theme_number]
        Text {
            anchors.centerIn: parent
            color: Themes.textcolor[Themes.theme_number]
            text: {
                let monitor = Hyprland.monitorFor(modelData)
                return monitor.activeWorkspace ? monitor.activeWorkspace.id : ""
            }
            font.pixelSize: 20
        }
    }
}
}
}
