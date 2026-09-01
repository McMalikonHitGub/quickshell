import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Shapes 1.11
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import qs.widgets
import qs.widgets.menuwidgets
import qs.themes
import qs.minecraft

PanelWindow {
    id: floatingWindow

    anchors {
        top: true
        left: true
        right: true
        bottom: true
    }
    margins {
        top: 300
        left: 800
        right: 800
        bottom: 300
    }

    implicitWidth: 300
    implicitHeight: 300
    visible: false
    color: "transparent"
    
    focusable: true

    WlrLayershell.keyboardFocus: WlrKeyboardFocus.OnDemand

    property var wpfolders : [] 


    Column {
        id: rootmenu
        anchors.centerIn: parent
            
        TextWidget {
            id: programsbutton
            inhalt: "Programs"
            inhaltcolor: Themes.textcolor[Themes.theme_number]

            width: floatingWindow.width
            height: floatingWindow.height/3

            function click() {
                rootmenu.visible = false
            }


        }
        
        TextWidget {
            id: themesbutton
            required property var modelData
            inhalt: "Themes"
            inhaltcolor: Themes.textcolor[Themes.theme_number]

            width: floatingWindow.width
            height: floatingWindow.height/3



            function click() {
                floatingWindow.margins.top = 350
                floatingWindow.margins.bottom = 350
                floatingWindow.margins.left = 5
                floatingWindow.margins.right = 5
                rootmenu.visible = false

                themerow.visible = true
                getwpfolders.running = true
            }

            Process {
                id: getwpfolders
                command: ["ls","/home/malik/pictures/wallpapers/"]

                stdout: StdioCollector {
                    onStreamFinished: {
                        const raw = this.text.trim()
                        const w = raw.split("\n")
                        floatingWindow.wpfolders = w
                    }
                }
            }
        }

        TextWidget {
            id: networkbutton
            required property var modelData
            inhalt: "Network"
            inhaltcolor: Themes.textcolor[Themes.theme_number]

            width: floatingWindow.width
            height: floatingWindow.height/3
        }
    }
    
    Theme {
        id: themerow
        rootmodel: floatingWindow.wpfolders
    }
    IpcHandler {
        target: "floatingWindow"

        function toggle(): void {
            floatingWindow.visible = !floatingWindow.visible
            floatingWindow.margins.top = 300
            floatingWindow.margins.bottom = 300
            floatingWindow.margins.left = 800
            floatingWindow.margins.right = 800

            rootmenu.visible = true
            themerow.visible = false
        }
        function back(): void {
            //base stats
            floatingWindow.margins.top = 300
            floatingWindow.margins.bottom = 300
            floatingWindow.margins.left = 800
            floatingWindow.margins.right = 800

            rootmenu.visible = true
            themerow.visible = false
        }
    }
}
