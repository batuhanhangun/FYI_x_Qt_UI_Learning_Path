import QtQuick 6.5
import QtQuick.Controls 6.5
import Qt_Design_Studio_2D_Demo

Rectangle {
    id: mainViewRectangle
    width: 1204
    height: 874
    color: "#ffffff"
    radius: 10
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left
    state: "Default"
    anchors.leftMargin: 100

    Image {
        id: image
        anchors.fill: parent
        source: "qrc:/qtquickplugin/images/template_image.png"
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
        anchors.topMargin: 20
        fillMode: Image.PreserveAspectFit

        Image {
            id: suitImage
            x: 195
            width: 100
            height: 100
            source: "qrc:/qtquickplugin/images/template_image.png"
            rotation: rotationSlider.value
            scale: zoomSlider.value
            fillMode: Image.PreserveAspectFit

            Image {
                id: alienImage
                x: 88
                y: 31
                width: 43
                height: 55
                visible: alienRadioButton.checked
                source: "images/alien.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: catImage
                x: 78
                y: 25
                width: 63
                height: 56
                visible: catRadioButton.checked
                source: "images/cat.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: glassesImage
                x: 67
                y: 16
                width: 77
                height: 84
                visible: (catRadioButton.checked || alienRadioButton.checked) && glassesSwitch.checked
                source: "images/sunglasses.png"
                fillMode: Image.PreserveAspectFit
            }
        }


    }

    Item {
        id: geometryItem
        x: 8
        y: 14
        width: 221
        height: 340
        visible: spaceRoundButton.checked || lagoonRoundButton.checked

        Slider {
            id: zoomSlider
            x: 12
            y: 36
            to: 2
            value: 1
        }

        Slider {
            id: rotationSlider
            x: 12
            y: 113
            value: 0
            to: 360
            from: -360
        }

        Text {
            id: zoomText
            x: 20
            y: 6
            //text: qsTr("Scale")
            text: qsTr("Zoom = " + (zoomSlider.value).toFixed(2))
            font.pixelSize: 25
            font.bold: true
        }

        Text {
            id: rotateText
            x: 20
            y: 78
            //text: qsTr("Rotate")
            text: qsTr("Rotation Angle = " + (rotationSlider.value).toFixed(0))
            font.pixelSize: 25
            font.bold: true
        }

        Slider {
            id: xPosSlider
            x: 12
            y: 205
            to: 944
            from: -15
            value: -15
        }

        Text {
            id: xPosText
            x: 20
            y: 180
            text: qsTr(qsTr("X = " + (xPosSlider.value).toFixed(0)))
            font.pixelSize: 25
            font.bold: true
        }

        Slider {
            id: yPosSlider
            x: 12
            y: 288
            value: -15
            to: 944
            from: -15
        }

        Text {
            id: yPosText
            x: 20
            y: 263
            text: qsTr(qsTr("Y = " + (yPosSlider.value).toFixed(0)))
            font.pixelSize: 25
            font.bold: true
        }
    }

    Image {
        id: anchorImage
        x: 493
        y: 363
        width: 100
        height: 100
        source: "qrc:/qtquickplugin/images/template_image.png"
        fillMode: Image.PreserveAspectFit
    }
    states: [
        State {
            name: "Lagoon"
            when: lagoonRoundButton.checked

            PropertyChanges {
                target: image
                source: "images/lagoon.jpg"
            }

            PropertyChanges {
                target: suitImage
                x: xPosSlider.value
                y: yPosSlider.value
                width: 234
                height: 308
                source: "images/diver.png"
            }

            PropertyChanges {
                target: rotationSlider
                x: 227
                y: 30
            }

            PropertyChanges {
                target: rotateText
                x: 234
                y: 0
            }

            PropertyChanges {
                target: xPosText
                x: 503
                y: 0
                width: 38
                height: 23
                font.pixelSize: 25
                font.bold: true
            }

            PropertyChanges {
                target: xPosSlider
                x: 495
                y: 30
            }

            PropertyChanges {
                target: yPosSlider
                x: 736
                y: 30
                to: 436
                from: 90
                value: 90
            }

            PropertyChanges {
                target: yPosText
                x: 744
                y: 0
            }

            PropertyChanges {
                target: anchorImage
                x: 599
                y: 478
                width: 304
                height: 265
                visible: anchorSwitch.checked
                source: "images/anchor.png"
            }
        },
        State {
            name: "Space"
            when: spaceRoundButton.checked

            PropertyChanges {
                target: image
                source: "images/planet.png"
            }

            PropertyChanges {
                target: suitImage
                x: xPosSlider.value
                y: yPosSlider.value
                width: 234
                height: 308
                source: "images/spacesuit.png"
            }

            PropertyChanges {
                target: rotationSlider
                x: 227
                y: 30
            }

            PropertyChanges {
                target: rotateText
                x: 234
                y: 0
            }

            PropertyChanges {
                target: xPosText
                x: 503
                y: 0
                font.pixelSize: 25
                font.bold: true
            }

            PropertyChanges {
                target: xPosSlider
                x: 495
                y: 30
                to: 976
            }

            PropertyChanges {
                target: yPosText
                x: 744
                y: 0
            }

            PropertyChanges {
                target: yPosSlider
                x: 736
                y: 30
                value: 70
                to: 450
                from: 70
            }

            PropertyChanges {
                target: anchorImage
                x: 887
                y: 179
                width: 150
                height: 126
                visible: spaceShipSwitch.checked
                source: "images/spaceship.png"
            }
        },
        State {
            name: "Default"
            when: !(lagoonRoundButton.checked && spaceRoundButton.checked) || resetButton.checked

            PropertyChanges {
                target: suitImage
                x: 859
                y: 590
            }

            PropertyChanges {
                target: zoomText1
                x: 8
                y: 157
                text: "x = 1.00"
            }

            PropertyChanges {
                target: xPosSlider
                value: -15
                to: 944
                from: -15
            }

            PropertyChanges {
                target: catImage
                visible: catRadioButton.checked && !clearButton.checked
            }

            PropertyChanges {
                target: alienImage
                visible: alienRadioButton.checked && !clearButton.checked
            }

            PropertyChanges {
                target: glassesImage
                visible: (catRadioButton.checked || alienRadioButton.checked) && glassesSwitch.checked && !clearButton.checked
            }
        }
    ]
}
