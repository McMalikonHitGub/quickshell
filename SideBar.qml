import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import qs.themes
import qs.widgets
import qs.singletons

import QtQuick.Window
import QtQuick.Controls

Popup {
        id: popup
        x: 100
        y: 100
        width: 200
        height: 300
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    }
