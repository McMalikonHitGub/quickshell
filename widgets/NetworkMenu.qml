import Quickshell
import Quickshell.Io
import QtQuick
import qs.singletons

PopupWindow {
    required property int pos
    Process {
        id:                         scanProc
        running: false
        command: ["nmcli", "-t", "-f", "SSID", "dev", "wifi"]
        stdout: StdioCollector {
            onStreamFinished: {
                networks = text.split("\n").filter(ssid => ssid.trim() !== "")
                console.log(networks)
            }
        }
    }        
    property string networksRaw:    ""
    property var networks:          []
    property bool netvis:           hovered
        anchor.rect.x: pos
        anchor.rect.y:Globals.barheight + 5
        implicitWidth:Globals.networkwidth
        implicitHeight: col.height
        visible: true
        Column {
            id: col
            Repeater {
                model: networks.length
                Rectangle {
                    width:200
                    height:30
                    Text {
                        text: networks[index]
                        color: Colors.text
                    }
                    Component.onCompleted: {
                        console.log("Widget:", index, networks[index])
                    }
                }
            }
        }
    }
