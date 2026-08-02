import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick.Controls
import QtQuick
import qs.singletons
import qs.themes

PopupWindow {
    id: root
    required property int pos
    property var networks: []
    anchor.rect.x: pos - 5
    anchor.rect.y: Globals.barheight//Themes.barheight[Themes.theme_number] + 10
    implicitHeight: Themes.networkwidget_is_x ? col.height+1 : 1
    implicitWidth: col.implicitWidth+5
    visible: Themes.networkmenu_vis
    color: Colors.bar

    Process {
        id:                         scanProc
        running: Themes.networkscan
        command: ["iwctl","station","wlan0","get-networks"]
        stdout: StdioCollector {
            onStreamFinished: {
                const networks = [];
                for (let line of this.text.split("\n")) {
                    line = line.replace(/\u001b\[[0-9;]*m/g, "");

                    console.log(line);
                    const m = line.match(/^\s*(.*?)\s{2,}(open|psk|8021x)\s{2,}(\*+)\s*$/);

                    if (!m) {
                        console.log("NO MATCH:", JSON.stringify(line));
                        continue;
                    }
                    networks.push({
                        ssid: m[1].trim(),
                        security: m[2],
                        signal: m[3].length
                    });
                }
                for (const n of networks) {
                    console.log(
                        `SSID=${n.ssid}, Security=${n.security}, Signal=${n.signal}`
                    );
                }
                root.networks=networks
            }
        }
    }
    Behavior on implicitHeight {
        NumberAnimation {duration:500}
    }
    Column {
        id: col
        spacing: 0
        anchors.centerIn: parent
        Repeater {
            model: root.networks.length
            TextWidget {
                id: a
                required property real index
                inhalt: root.networks[index].ssid
                inhaltcolor: Colors.text
                    function enter() {
                        console.log("lol") 
                    }
                    function click() {
                        passwordPopup.visible   = true
                        passwordPopup.ssid      = root.networks[index].ssid
                        passwordField.text      = ""
                    }        
                height: 15
                border.color: Colors.bar
                color: hovered ? Colors.blur : Colors.bar
            }
        }
    }
    PopupWindow {
        anchor.window:  root
        id:             passwordPopup
        anchor.rect.x:  -passwordPopup.width
        anchor.rect.y:  Globals.barheight + 10
        implicitHeight: col2.implicitHeight
        implicitWidth:  col2.implicitWidth+5
        visible:        false
        color: Colors.bar
        HyprlandFocusGrab {
            windows: [passwordPopup]
            active: passwordPopup.visible
        }

        onVisibleChanged: {
            if (visible)
            passwordField.forceActiveFocus()
        }

        property string ssid
        Column {
            id: col2
            Row {
                TextWidget {
                    inhalt: `Passwort für ${passwordPopup.ssid}`
                    inhaltcolor: Colors.text
                }
                TextField {
                    id: passwordField
                    echoMode: TextInput.Password
                    Keys.onPressed: event => {
        console.log("KEY:", event.text)
    }
                }
            }
            TextWidget {
                inhalt: ""
                inhaltcolor: Colors.text
                color: "red"
                function click() {
                    passwordPopup.visible = false
                    root.visible = false
                }
            }

            TextWidget {
                inhalt: "connect"
                inhaltcolor: Colors.text
                function click() {
                    connectProcess.running = true
                }
            }
        }
    }
    Process {
        id: connectProcess
        command: [
            "iwctl",
            "--passphrase", passwordField.text,
            "station", "wlan0",
            "connect", passwordPopup.ssid
        ]
    }
}
