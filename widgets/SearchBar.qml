import Quickshell
import QtQuick
import QtQuick.Controls

import qs.themes
Rectangle {
    id: box
    height: Themes.barheight[Themes.theme_number]
    width: row.width
    color: "transparent"
    HoverHandler{
        id:mouse
        onHoveredChanged: {
            if (hovered)
                inputField.forceActiveFocus()
        }
    }

    Row {
        id: row
        TextWidget {
            id: displayIcon
            inhalt: ""
            inhaltcolor: Themes.textcolor[Themes.theme_number]
        }
        TextField {
            id: inputField
            visible: mouse.hovered
            focus: mouse.hovered
            placeholderText: qsTr("Enter name")
        }
    }
}
