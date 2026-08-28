import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.widgets
import qs.themes
import qs.minecraft

Scope {
    Variants {
        model: Quickshell.screens
        Loader {
            anchors.fill: parent
            required property var modelData

            sourceComponent:
                Themes.theme_number === 0 ? theme_1 :
                Themes.theme_number === 1 ? theme_2 :
                Themes.theme_number === 2 ? theme_3 :
                Themes.theme_number === 3 ? theme_4 :
                Themes.theme_number === 4 ? theme_5 :
                Themes.theme_number === 5 ? theme_6 :
                Themes.theme_number === 6 ? theme_7 :
                Themes.theme_number === 7 ? theme_8 :
                Themes.theme_number === 8 ? theme_9 :
                null
            onLoaded: {
                item.screen = modelData
            }
        }
    }
    WorkspaceIndicator {}
    Menu{}


    Component {
        id: theme_1
        Theme_1 {}
    }
    
    Component {
        id: theme_2
        Theme_2 {}
    }

    Component {
        id: theme_3
        Theme_3 {}
    }

    Component {
        id: theme_4
        Theme_4 {}
    }

    Component {
        id: theme_5
        Theme_5 {}
    }

    Component {
        id: theme_6
        Theme_6 {}
    }

    Component {
        id: theme_7
        Theme_7 {}
    }

    Component {
        id: theme_8
        Theme_8 {}
    }

    Component {
        id: theme_9
        Theme_9 {}
    }
}


