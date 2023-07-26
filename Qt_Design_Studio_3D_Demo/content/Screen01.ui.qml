

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick3D 6.5
import Qt_Design_Studio_3D_Demo
import Quick3DAssets.Scene
import Quick3DAssets.Greenscreen

Rectangle {

    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor
    state: "Default"

    View3D {
        id: view3D
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 1
        anchors.topMargin: 0

        environment: sceneEnvironment

        SceneEnvironment {
            id: sceneEnvironment
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.High
        }

        Node {
            id: scene

            PerspectiveCamera {
                id: sceneCamera
                x: 1.005
                y: 99.991
                z: 612.35876
            }

            Scene {
                id: paladin
                x: -0.225
                y: -6.937
                eulerRotation.y: rotationYSlider.value
                scale.z: 100
                scale.y: 100
                scale.x: 100
                z: 5.11136
            }

            Greenscreen {
                id: greenscreen
                x: -0.757
                y: -2.778
                eulerRotation.z: 0
                eulerRotation.y: -0.15702
                eulerRotation.x: 0
                z: 6.74545
                scale.z: 100
                scale.y: 100
                scale.x: 100
            }

            PointLight {
                id: pointLight
                castsShadow: shadowSwitch.checked
                brightness: brightnessSlider.value
                shadowBias: 0
                shadowFactor: 28
                shadowFilter: 1
                shadowMapQuality: Light.ShadowMapQualityVeryHigh
                z: 200
            }
            SpotLight {
                id: spotLight
                coneAngle: 60
                castsShadow: shadowSwitch.checked
                brightness: brightnessSlider.value
                shadowBias: 0
                shadowFactor: 28
                shadowFilter: 1
                shadowMapQuality: Light.ShadowMapQualityVeryHigh
                z: 200
            }

            DirectionalLight {
                id: directionalLight
                x: 0
                y: 0
                castsShadow: shadowSwitch.checked
                brightness: brightnessSlider.value
                shadowBias: 0
                shadowFactor: 28
                shadowFilter: 1
                shadowMapQuality: Light.ShadowMapQualityVeryHigh
                eulerRotation.z: -0
                eulerRotation.y: 0
                eulerRotation.x: 0
                z: 200
            }
        }

        Slider {
            id: rotationYSlider
            x: 800
            y: 391
            height: 175
            opacity: 0
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            stepSize: 0
            to: 360
            from: -360
            value: 0
        }

        Switch {
            id: lightSwitch
            x: 56
            y: 101
            width: 327
            height: 28
            text: qsTr("Lights ON/OFF")
            font.bold: true
            font.pointSize: 25
            checked: false
        }

        Switch {
            id: shadowSwitch
            x: 47
            y: 538
            width: 345
            height: 28
            text: qsTr("Shadows ON/OFF")
            font.pointSize: 25
            font.bold: true
        }
    }

    Item {
        id: __materialLibrary__
        DefaultMaterial {
            id: defaultMaterial
            objectName: "Default Material"
            diffuseColor: "#4aee45"
        }
    }

    Item {
        id: lightSourceItem
        x: 60
        y: 150
        width: 310
        height: 166
        visible: lightSwitch.checked

        RadioButton {
            id: directionalLightSourceSelectionRadioButton
            x: 0
            y: 11
            width: 280
            height: 47
            text: qsTr("Directional Light")
            font.pointSize: 25
        }

        RadioButton {
            id: pointLightSourceSelectionRadioButton
            x: 0
            y: 59
            width: 280
            height: 47
            text: qsTr("Point Light")
            font.pointSize: 25
        }

        RadioButton {
            id: spotLightSourceSelectionRadioButton
            x: 0
            y: 105
            width: 280
            height: 47
            visible: true
            text: qsTr("Spot Light")
            font.pointSize: 25
        }
    }

    Item {
        id: brightnessItem
        x: 36
        y: 443
        width: 342
        height: 59
        visible: lightSwitch.checked
                 && (directionalLightSourceSelectionRadioButton.checked
                     || spotLightSourceSelectionRadioButton.checked
                     || pointLightSourceSelectionRadioButton.checked)

        Slider {
            id: brightnessSlider
            x: 14
            y: 51
            to: 200
            value: 0
            enabled: spotLightSourceSelectionRadioButton.checked
                     || pointLightSourceSelectionRadioButton.checked
                     || directionalLightSourceSelectionRadioButton.checked
        }

        Text {
            id: brightnessSliderText
            x: 19
            y: 10
            text: qsTr("Brightness")
            font.pixelSize: 25
            font.bold: true
        }
    }

    Text {
        id: stateText
        x: 901
        y: 47
        width: 408
        height: 75
        text: qsTr("State: Default")
        font.pixelSize: 30
        font.bold: true
    }

    states: [
        State {

            name: "Spot Light"
            when: spotLightSourceSelectionRadioButton.checked
                  && lightSwitch.checked

            PropertyChanges {
                target: stateText
                text: qsTr("State: Spot Light")
            }

            PropertyChanges {
                target: spotLight
                brightness: brightnessSlider.value
            }
            PropertyChanges {
                target: spotLight
                visible: true
            }
            PropertyChanges {
                target: directionalLight
                visible: false
            }
            PropertyChanges {
                target: pointLight
                visible: false
            }

            PropertyChanges {
                target: brightnessItem
                visible: lightSwitch.checked
                         && (directionalLightSourceSelectionRadioButton.checked
                             || spotLightSourceSelectionRadioButton.checked
                             || pointLightSourceSelectionRadioButton.checked)
            }
        },
        State {
            name: "Directional Light"
            when: directionalLightSourceSelectionRadioButton.checked
                  && lightSwitch.checked
            PropertyChanges {
                target: stateText
                text: qsTr("State: Directional Light")
            }
            PropertyChanges {
                target: directionalLight
                brightness: brightnessSlider.value
            }
            PropertyChanges {
                target: directionalLight
                visible: true
            }
            PropertyChanges {
                target: spotLight
                visible: false
            }
            PropertyChanges {
                target: pointLight
                visible: false
            }

            PropertyChanges {
                target: brightnessItem
                visible: lightSwitch.checked
                         && (directionalLightSourceSelectionRadioButton.checked
                             || spotLightSourceSelectionRadioButton.checked
                             || pointLightSourceSelectionRadioButton.checked)
            }
        },
        State {
            name: "Point Light"
            when: pointLightSourceSelectionRadioButton.checked
                  && lightSwitch.checked
            PropertyChanges {
                target: stateText
                text: qsTr("State: Point Light")
            }
            PropertyChanges {
                target: pointLight
                eulerRotation.z: 0
                eulerRotation.y: 0
                eulerRotation.x: 24.97592
                quadraticFade: 1.00003
                constantFade: brightnessSlider.value
                //brightness: pointLight.value
            }
            PropertyChanges {
                target: pointLight
                visible: true
            }
            PropertyChanges {
                target: directionalLight
                visible: false
            }
            PropertyChanges {
                target: spotLight
                visible: false
            }

            PropertyChanges {
                target: brightnessItem
                visible: lightSwitch.checked
                         && (directionalLightSourceSelectionRadioButton.checked
                             || spotLightSourceSelectionRadioButton.checked
                             || pointLightSourceSelectionRadioButton.checked)
            }

            PropertyChanges {
                target: greenscreen
                eulerRotation.y: -0.15702
            }
        },
        State {
            name: "Default"
            when: !lightSwitch.checked
            PropertyChanges {
                target: lightSourceItem
                visible: false
            }

            PropertyChanges {
                target: shadowSwitch
                visible: false
            }

            PropertyChanges {
                target: spotLight
                visible: false
            }
            PropertyChanges {
                target: directionalLight
                visible: false
            }
            PropertyChanges {
                target: pointLight
                visible: false
            }
            PropertyChanges {
                target: shadowSwitch
                visible: false
            }
        },
        State {
            name: "Lights On"
            when: lightSwitch.checked
            PropertyChanges {
                target: lightSourceItem
                visible: true
            }

            PropertyChanges {
                target: shadowSwitch
                visible: false
            }
        },
        State {
            name: "Lights Off"
            when: !lightSwitch.checked
            PropertyChanges {
                target: lightSourceItem
                visible: false
            }

            PropertyChanges {
                target: shadowSwitch
                visible: false
            }

            PropertyChanges {
                target: spotLight
                visible: false
            }
            PropertyChanges {
                target: directionalLight
                visible: false
            }
            PropertyChanges {
                target: pointLight
                visible: false
            }
            PropertyChanges {
                target: shadowSwitch
                visible: false
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;matPrevEnvDoc:"SkyBox";matPrevEnvValueDoc:"preview_studio";matPrevModelDoc:"#Sphere"}
D{i:10}D{i:12}
}
##^##*/

