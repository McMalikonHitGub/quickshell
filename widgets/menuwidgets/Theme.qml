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
    x:300
        id: themerow
        visible: false
        spacing: -30
        property real counter: 0
        Repeater {
            model: floatingWindow.wpfolders 
            Item {
                id:container
                width: mouse.containsMouse ? floatingWindow.width/modelData.length + 5 : floatingWindow.width/modelData.length
                height: mouse.containsMouse ? floatingWindow.height + 5 : floatingWindow.height
                required property var modelData
                required property real index
                property string path: "file:///home/malik/pictures/wallpapers/" + modelData + "/"
                property string coverpath: path + "cover.png"
                property real slant: 30
                focus: true
                Keys.onPressed: (event)=> {if (event.key == Qt.Key_Enter) increment; }

                function increment() {
                    counter++ 
                }

                
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
                        startX: container.startXForPath
                        startY: 0

                        PathLine {
                            x: container.width
                            y: 0
                        }

                        PathLine {
                            x: container.width - container.slant
                            y: container.height
                        }

                        PathLine {
                            x: 0
                            y: container.height
                        }

                        PathLine {
                            x: container.slant
                            y: 0
                        }

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
                    onClicked: console.log(counter)
                    hoverEnabled: true
                }


                //Process {
                //    id: wpswitcher
                //    command: ["hyprctl","hyprpaper","wallpaper",",/home/malik/pictures/wallpapers/" + modelData]
                //}

                function click() {
                    wpswitcher.running = true
                    console.log(counter)
                }
            }
        }
    }
