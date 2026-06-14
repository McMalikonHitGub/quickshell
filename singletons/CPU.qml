import Quickshell
import Quickshell.Io
import QtQuick

pragma Singleton

Singleton {
    property int tempC: 0
    property int tempK: 0
    Process {
        running: true
        command: ["cat", "/sys/class/thermal/thermal_zone0/temp"]
        stdout: StdioCollector {
            onStreamFinished: {
                tempC = (parseInt(text.trim()) / 1000).toFixed(1)
                tempK = tempC + 273

            }
        }
    }
}
