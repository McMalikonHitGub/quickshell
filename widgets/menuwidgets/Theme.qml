import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Shapes 1.11
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import qs.widgets
import qs.themes
Row {
    x: parent.width/2 - picwidth/2 - counter * (picwidth - 30)
        id: themerow
        visible: false
        spacing: -30
        height: 300
        property real counter: 0
        property real picwidth: 300
        required property list<string> rootmodel

    Behavior on x {
        NumberAnimation {
            duration: 100
        }
    }
    
    Repeater {
        id: rep
        model: rootmodel.length
        Item {
            id:container
            required property var modelData
            property var folder: modelData
            required property real index
            property string path: "file:///home/malik/pictures/wallpapers/" + modelData + "/"
            property string coverpath: path + "cover.png"
            property string displayed: coverpath
            property real slant: 30
            property bool wpbool: false
            focus: true
            Keys.onPressed: (event)=> {
                if (event.key == Qt.Key_Right) increment();
                else if (event.key == Qt.Key_Left) decrease();
            }

            width: index == counter ? themerow.picwidth + 20 : themerow.picwidth
            height: index == counter ? 250 + 20 : 250

            Behavior on width {NumberAnimation {duration: 200}}
            Behavior on height {NumberAnimation {duration: 200}}
            function increment() {counter++}
            function decrease() {counter--}

            Item {
                id: cover
                anchors.fill: parent
                visible: false
                Image{
                    id:coverimage
                    anchors.fill:parent
                    source: coverpath
                    fillMode: Image.PreserveAspectCrop
                }

                Rectangle {
                    id: textbelow
                    color: "black"
                    width: container.width
                    height: 30
                    opacity: 0.8
                    anchors.bottom:parent.bottom
                    y: coverimage.height-textbelow.height
                    Text {
                        x:10
                        color:"white"
                        text: modelData + " "
                        font.pixelSize:20
                    }
                }
            }

            Shape {
                id: maskShape
                anchors.fill: parent
                layer.enabled: true

                ShapePath {
                    startX: container.slant
                    startY: 0
                    PathLine {x: container.width;y: 0}
                    PathLine {x: container.width - container.slant;y: container.height}
                    PathLine {x: 0;y: container.height}
                    PathLine {x: container.slant;y: 0}
                    fillColor: "white"
                    strokeWidth: 0
                }
            }                
                
            OpacityMask {
                anchors.fill: parent
                source: cover
                maskSource: maskShape
            }

            MouseArea{
                id:mouse
                anchors.fill:parent
                cursorShape: Qt.PointingHandCursor
                onClicked: openfolder() 
                hoverEnabled: true
            }

            function openfolder() {
                getwps.running = true
            }

            Process {
                id: getwps
                command: ["ls","/home/malik/pictures/wallpapers/" + rootmodel[counter]]

                stdout: StdioCollector {
                    onStreamFinished: {
                        const raw = this.text.trim()
                        const w = raw.split("\n")
                        wprep.model = w
                        console.log(w)
                    }
                }
            }
        }
    }
}
