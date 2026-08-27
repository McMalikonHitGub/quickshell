import Quickshell
import QtQuick

pragma Singleton

Singleton {
    property real theme_number:                 0

    property list<string> themes_icons: ["1","2","3","4","5","6","7","8","9"]

    property list<string> font: [
        "Monocraft",
        "cubic",
        "HeavyDataNerdFont-Regular",
        "HeavyDataNerdFont-Regular",
        "HeavyDataNerdFont-Regular",
        "HeavyDataNerdFont-Regular",
        "HeavyDataNerdFont-Regular",
        "HeavyDataNerdFont-Regular"
        ]

    property list<real> gap: [
        5,-1,0,5,5,5,5,5,5
    ]

    property list<real> borderwidth: [
        1,1,1,0,0,0,0,0,0
    ]

    property list<real> radius: [
        5,0,15,5,5,5,5,5,5
    ]

    property list<real> barheight: [
        20,40,30,30,30,30,30,30,30
    ]

    property list<real> bindmenuwidgetheight: [
        barheight[theme_number],barheight[theme_number],40,barheight[theme_number],barheight[theme_number],barheight[theme_number],barheight[theme_number],barheight[theme_number],barheight[theme_number]
    ]

    //Colors and stuff
    property list<var> barcolor: [
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0),
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0),
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0)
    ]

    property list<var> widgetcolor: [
        Qt.rgba(0.0, 0.0, 0.0, 1.0), Qt.rgba(0.1, 0.1, 0.1, 1.0), Qt.rgba(0.0, 0.0, 0.0, 0.0),
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0),
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0)
    ]

    property list<var> bordercolor: [
        Qt.rgba(0.8, 0.8, 0.8, 1.0), Qt.rgba(0.0, 1.0, 1.0, 1.0), Qt.rgba(0.0, 0.0, 0.0, 0.0),
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0),
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0)
    ]

    property list<var> hovercolor: [
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0),
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0),
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0)
    ]

    property list<var> batterymid: [
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0),
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0),
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0)
    ]

    property list<var> batterylow: [
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0),
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0),
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0)
    ]

    property list<var> textcolor: [
        Qt.rgba(1.0, 1.0, 1.0, 1.0), Qt.rgba(0.0, 1.0, 1.0, 1.0), Qt.rgba(0.0, 0.0, 0.0, 0.0),
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0),
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0)
    ]

    property list<var> workspaceinactivecolor: [
        Qt.rgba(1.0, 1.0, 1.0, 0.5), Qt.rgba(0.0, 1.0, 1.0, 0.5), Qt.rgba(0.0, 0.0, 0.0, 0.0),
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0),
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0)
    ]

    property list<var> batteryfillcolor: [
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0),
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0),
        Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0), Qt.rgba(0.0, 0.0, 0.0, 0.0)
    ]

    //icons
    property list<string> kitty_icon: [
        "󰄛","󰄛","file:///home/malik/.config/quickshell/minecraft/icons/cat_spawn_egg.png","󰀻","󰀻","󰀻","󰀻","󰀻","󰀻"
    ]

    property list<string> filemanager_icon: [
        "󱢴","󱢴","file:///home/malik/.config/quickshell/minecraft/icons/Dolphins_Grace.png","󰀻","󰀻","󰀻","󰀻","󰀻","󰀻"
    ]

    property list<string> firefox_icon: [
        "󰈹","󰈹","file:///home/malik/.config/quickshell/minecraft/icons/fox_spawn_egg.png","󰀻","󰀻","󰀻","󰀻","󰀻","󰀻"
    ]

    property list<string> obsidian_icon: [
        "󰮊","󰮊","file:///home/malik/.config/quickshell/minecraft/icons/Obsidian.png","󰀻","󰀻","󰀻","󰀻","󰀻","󰀻"
    ]

    property list<string> vim_icon: [
        "","","","󰀻","󰀻","󰀻","󰀻","󰀻","󰀻"
    ]

    property list<string> network_icon: [
        "󰘊","󰘊","󰘊","󰀻","󰀻","󰀻","󰀻","󰀻","󰀻"
    ]

    property list<string> mute_icon: [
        "","","","󰀻","󰀻","󰀻","󰀻","󰀻","󰀻"
    ]

    property list<string> unmute_icon: [
        "","","","󰀻","󰀻","󰀻","󰀻","󰀻","󰀻"
    ]

    property list<string> x_icon: [
        "","","","󰀻","󰀻","󰀻","󰀻","󰀻","󰀻"
    ]

    property list<string> wlogoutwidget_icon: [
        "󰍃","2","󰍃","󰀻","󰀻","󰀻","󰀻","󰀻","󰀻"
    ]

    property list<string> hyprlock_icon: [
        "","v","","󰀻","󰀻","󰀻","󰀻","󰀻","󰀻"
    ]

    property list<string> shutdown_icon: [
        "","","","󰀻","󰀻","󰀻","󰀻","󰀻","󰀻"
    ]

    property list<string> reboot_icon: [
        "","","","󰀻","󰀻","󰀻","󰀻","󰀻","󰀻"
    ]

    property list<string> discord_icon: [
        "","","","󰀻","󰀻","󰀻","󰀻","󰀻","󰀻"
    ]

    property list<string> spotify_icon: [
        "󰓇","󰓇","file:///home/malik/.config/quickshell/minecraft/icons/music_disc_lava_chicken.png","󰀻","󰀻","󰀻","󰀻","󰀻","󰀻"
    ]

    property list<string> steam_icon: [
        "󰓓","󰓓","file:///home/malik/.config/quickshell/minecraft/icons/MC_Steam.png","󰀻","󰀻","󰀻","󰀻","󰀻","󰀻"
    ]

    property list<string> bindmenu_icon: [
        "󰀻","󰛡","file:///home/malik/.config/quickshell/minecraft/icons/Arrow_Right.png","󰀻","󰀻","󰀻","󰀻","󰀻","󰀻"
    ]

    //hard widths
    property list<real> wlogoutwidth: [
        20,20,20,20,20,20,20,20,20 
    ]


    //boolians
    property bool wlogoutwidget_is_x:           false
    property bool wlogoutmenu_vis:              false
    property bool networkwidget_is_x:           false

    property bool thememenu_vis:                false
    property bool networkmenu_vis:              false
    property bool programmenu_vis:              false

    property bool networkscan:                  false
}
