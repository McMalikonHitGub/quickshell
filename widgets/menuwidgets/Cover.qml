import Quickshell
import Quickshell.Io
import QtQuick

import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick.Shapes 1.11
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import qs.widgets
import qs.themes
RowLayout {
    id: root
    width: parent.width 
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.horizontalCenterOffset: offset

    required property var wps
    property real offset: -wpwidth/2
    height: 300
    property real wpwidth: 300
    spacing: -30
    property real counter: 0

    Keys.onPressed: (event)=> {
        if      (event.key == Qt.Key_Right) { incre(); updateModel();} 
        else if (event.key == Qt.Key_Left)  { decre(); updateModel();} 
        else if (event.key == Qt.Key_Return) { root.changewp.running = true }
    }

    NumberAnimation {
        id: moveAnimation
        target: root
        property: "offset"
        duration: 300
    }
    Timer                           {id: delayedLeft;     interval: 0; running: false; repeat: false; onTriggered: {updateModel(); decre();}}
    Timer                           {id: delayedRight;    interval: 0; running: false; repeat: false; onTriggered: {updateModel(); incre();}}
    function incre()                { if (counter < root.wps.length -1)     { counter++ }                               else { counter = 0 } }
    function decre()                { if (counter > 0)                      { counter-- }                               else { counter = root.wps.length - 1 } }
    function start(k)               { if (counter < k)                      { return root.wps.length + counter - k }    else { return counter - k } }
    function end(k)                 { if (counter >= root.wps.length -k)    { return counter + k - root.wps.length }    else { return counter + k } }
    function updateModel()          { m = [start(4),start(3),start(2),start(1),counter,end(1),end(2),end(3),end(4)] }

    focus: true

    property var m: [start(4),start(3),start(2),start(1),0,end(1),end(2),end(3),end(4)]
    // test list
    property list<string> numbers: ["Null","eins","zwei","drei","vier","fünf","sechs","sieben","acht","neun","zehn","elf","zwölf","dreizehn","vierzehn","fünfzehn","sechzehn","siebzehn","achtzehn","neunzehn"]

    Repeater {
        id: rep
        model: m
        Item {
            id:container
            required property real modelData
            required property real index
            property string path: "file:///home/malik/pictures/wallpapers/" + root.wps[modelData]
            property real slant: modelData == counter ? -root.spacing + 10 : - root.spacing
            focus: true

            width: modelData == counter ? root.wpwidth + 50 : root.wpwidth-50
            height: modelData == counter ? root.wpwidth + 50 : root.wpwidth -50

            Item {
                id: cover
                anchors.fill: parent
                visible: false
                Image{
                    id:coverimage
                    anchors.fill:parent
                    source: path
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
                        text: root.wps[modelData].split(".")[0]
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
                id: mouse
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: changewp.running = true
                hoverEnabled: true
                onWheel: (event) => {
                    if (event.angleDelta.y > 0) {
                        root.incre()
                        root.updateModel()
                    } else if (event.angleDelta.y < 0) {
                        root.decre()
                        root.updateModel()
                    }
                    event.accepted = true
                }
            }
            Process {
                id: changewp
                command: ["hyprctl","hyprpaper","wallpaper","," + "/home/malik/pictures/wallpapers/" + root.wps[modelData]]
            }
        }
    }
}

