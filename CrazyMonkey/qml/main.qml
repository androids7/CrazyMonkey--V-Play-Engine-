import VPlay 1.0
import QtQuick 1.1

GameWindow {
    activeScene: scene
    // the size of the Window can be changed at runtime by pressing the number keys 1-7
    // the content of the logical scene size (480x320 by default) gets scaled to the window size based on the scaleMode
    // you can set this size to any resolution you would like your project to start with, most of the times the one of your main target device
    // this resolution is for iPhone 4 & iPhone 4S
    // change this to a portrait resolution (e.g. 640x960) for games in portrait mode
    width: 960
    height: 640
    
    Scene {
        id: scene
        // the "logical size" - the scene content is auto-scaled to match the GameWindow size
        // change this to 320x480 for games in portrait mode
        width: 480
        height: 320
        
        // background rectangle matching the logical scene size (= safe zone available on all devices)
        Rectangle {
            id: rectangle
            anchors.fill: parent
            color: "grey"
            
            Text {
                id: textElement
                // qsTr() uses the internationalization feature for multi-language support
                text: qsTr("Hello World")
                color: "#ffffff"
                anchors.centerIn: parent
            }
            
            // use a MultiTouchArea instead of a MouseArea to detect multiple simultaneous touches
            MouseArea {
                anchors.fill: parent
                
                // when the rectangle that fits the whole scene is pressed, change the background color and the text
                onPressed: {
                    textElement.text = qsTr("Scene-Rectangle is pressed at position " + mouseX + "," + mouseY);
                    rectangle.color = "black";
                    console.debug("pressed position:", mouseX, mouseY);
                }
                
                onPositionChanged: {
                    textElement.text = qsTr("Scene-Rectangle is moved at position " + mouseX + "," + mouseY);
                    console.debug("mouseMoved or touchDragged position:", mouseX, mouseY);
                }
                
                // revert the text & color after the touch/mouse button was released
                // also States could be used for that - search for "QML States" in the doc
                onReleased: {
                    textElement.text = qsTr("Hello World");
                    rectangle.color = "grey";
                    console.debug("released position:", mouseX, mouseY);
                }
            }
        }
    }
}

