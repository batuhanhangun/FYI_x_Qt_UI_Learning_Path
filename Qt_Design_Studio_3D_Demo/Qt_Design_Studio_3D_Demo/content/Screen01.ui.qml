

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
                eulerRotation.y: rotationSlider.value
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
                x: distanceXSlider.value
                y: distanceYSlider.value
                z: distanceZSlider.value
                linearFade: linearFadeSlider1.value
                constantFade: constantFadeSlider1.value
                brightness: brightnessSlider2.value
                castsShadow: shadowSwitch.checked
                shadowBias: 0
                shadowFactor: 28
                shadowFilter: 1
                shadowMapQuality: Light.ShadowMapQualityVeryHigh
            }
            SpotLight {
                id: spotLight
                x: distanceXSlider.value
                y: distanceYSlider.value
                innerConeAngle: innerConeAngleSlider.value
                coneAngle: coneAngleSlider.value
                quadraticFade: quadraticSlider2.value
                linearFade: linearFadeSlider2.value
                constantFade: constantFadeSlider2.value
                z: distanceZSlider.value
                brightness: brightnessSlider3.value
                castsShadow: shadowSwitch.checked
                shadowBias: 0
                shadowFactor: 28
                shadowFilter: 1
                shadowMapQuality: Light.ShadowMapQualityVeryHigh
            }

            DirectionalLight {
                id: directionalLight
                x: distanceXSlider.value
                y: distanceYSlider.value
                z: distanceZSlider.value
                brightness: brightnessSlider1.value
                castsShadow: shadowSwitch.checked
                shadowBias: 0
                shadowFactor: 28
                shadowFilter: 1
                shadowMapQuality: Light.ShadowMapQualityVeryHigh
                eulerRotation.z: -0
                eulerRotation.y: 0
                eulerRotation.x: 0
            }
        }

        Slider {
            id: rotationSlider
            x: 800
            y: 462
            height: 175
            opacity: 0
            visible: true
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
            id: shadowSwitch
            x: 56
            y: 404
            width: 345
            height: 28
            text: qsTr("Shadows ON/OFF")
            font.pointSize: 25
            font.bold: true
        }

        Switch {
            id: lightSwitch
            x: 56
            y: 101
            width: 327
            height: 28
            text: qsTr("Lights ON/OFF")
            autoExclusive: false
            font.bold: true
            font.pointSize: 25
            checked: false
        }

        Item {
            id: lightSourceItem
            x: 1609
            y: 0
            width: 310
            height: 166
            visible: lightSwitch.checked

            RadioButton {
                id: directionalLightRadioButton
                x: 0
                y: 11
                width: 280
                height: 47
                text: qsTr("Directional Light")
                font.pointSize: 25
            }

            RadioButton {
                id: pointLightRadioButton
                x: 0
                y: 59
                width: 280
                height: 47
                text: qsTr("Point Light")
                font.pointSize: 25
            }

            RadioButton {
                id: spotLightRadioButton
                x: 0
                y: 105
                width: 280
                height: 47
                visible: true
                text: qsTr("Spot Light")
                font.pointSize: 25
            }
        }

        Text {
            id: stateText
            x: 900
            y: 47
            width: 408
            height: 75
            text: qsTr("State: Default")
            font.pixelSize: 30
            font.bold: true
        }

        Text {
            id: pointLightPropertiesText
            x: 1675
            y: 172
            visible: lightSwitch.checked && pointLightRadioButton.checked
            text: qsTr("Properties")
            font.pixelSize: 30
            verticalAlignment: Text.AlignTop
            font.bold: true
        }

        Text {
            id: spotLightPropertiesText
            x: 1675
            y: 172
            visible: lightSwitch.checked && spotLightRadioButton.checked
            text: qsTr("Properties")
            font.pixelSize: 30
            verticalAlignment: Text.AlignTop
            font.bold: true
        }

        Text {
            id: directionalLightPropertiesText
            x: 1675
            y: 172
            visible: lightSwitch.checked && directionalLightRadioButton.checked
            text: qsTr("Properties")
            font.pixelSize: 30
            verticalAlignment: Text.AlignTop
            font.bold: true
        }

        Item {
            id: directionaLightItem
            x: 1610
            y: 282
            width: 182
            height: 67
            visible: directionalLightRadioButton.checked && lightSwitch.checked

            Text {
                id: brightnessText1
                x: 0
                y: -26
                text: qsTr("Brightness")
                font.pixelSize: 25
            }
            Slider {
                id: brightnessSlider1
                x: -1
                y: 13
                to: 100
                value: 0
            }
        }

        Item {
            id: pointLightItem
            x: 1610
            y: 282
            width: 309
            height: 271
            visible: lightSwitch.checked && pointLightRadioButton.checked

            Text {
                id: brightnessText2
                x: 0
                y: -26
                text: qsTr("Brightness")
                font.pixelSize: 25
            }
            Slider {
                id: brightnessSlider2
                x: -1
                y: 13
                to: 100
                value: 0
            }

            Text {
                id: constantFadeText1
                x: -1
                y: 53
                width: 160
                height: 30
                text: qsTr("Constant Fade")
                font.pixelSize: 25
            }
            Slider {
                id: constantFadeSlider1
                x: -1
                y: 92
                to: 20
                value: 0
            }

            Text {
                id: linearFadeText1
                x: -2
                y: 132
                text: qsTr("Linear Fade")
                font.pixelSize: 25
            }
            Slider {
                id: linearFadeSlider1
                x: -1
                y: 171
                to: 20
                value: 0
            }
        }

        Item {
            id: spotLightItem
            x: 1610
            y: 272
            width: 309
            height: 271
            visible: lightSwitch.checked && spotLightRadioButton.checked

            Text {
                id: brightnessText3
                x: 0
                y: -26
                text: qsTr("Brightness")
                font.pixelSize: 25
            }
            Slider {
                id: brightnessSlider3
                x: -1
                y: 13
                to: 100
                value: 0
            }

            Text {
                id: constantFadeText2
                x: -1
                y: 53
                width: 160
                height: 30
                text: qsTr("Constant Fade")
                font.pixelSize: 25
            }
            Slider {
                id: constantFadeSlider2
                x: -1
                y: 92
                value: 0.5
            }

            Text {
                id: linearFadeText2
                x: -2
                y: 132
                text: qsTr("Linear Fade")
                font.pixelSize: 25
            }
            Slider {
                id: linearFadeSlider2
                x: -1
                y: 171
                to: 20
                value: 0
            }

            Text {
                id: quadraticFadeText2
                x: -1
                y: 211
                text: qsTr("Quadratic Fade")
                font.pixelSize: 25
            }
            Slider {
                id: quadraticSlider2
                x: 0
                y: 250
                value: 0
            }

            Text {
                id: coneAngleText
                x: 1
                y: 290
                text: qsTr("Cone Angle")
                font.pixelSize: 25
            }
            Slider {
                id: coneAngleSlider
                x: 2
                y: 329
                to: 180
                value: 0
            }

            Text {
                id: innerConeAngleText
                x: 3
                y: 359
                text: qsTr("Inner Cone Angle")
                font.pixelSize: 25
            }
            Slider {
                id: innerConeAngleSlider
                x: 4
                y: 392
                to: 180
                value: 0
            }
        }

        Item {
            id: distanceXItem
            x: 56
            y: 154
            width: 275
            height: 72
            visible: lightSwitch.checked
                     && (spotLightRadioButton.checked
                         || pointLightRadioButton.checked
                         || directionalLightRadioButton.checked)
            Slider {
                id: distanceXSlider
                x: 6
                y: 39
                width: 261
                height: 19
                to: 250
                from: -250
                value: 0
            }

            Text {
                id: distanceXText
                x: 6
                y: 0
                textFormat: Text.RichText
                text: qsTr("T<sub>X</sub> = " + (distanceXSlider.value).toFixed(
                               0))
                font.pixelSize: 25
                font.bold: true
            }
        }

        Item {
            id: distanceYItem
            x: 56
            y: 214
            width: 275
            height: 72
            visible: lightSwitch.checked
                     && (spotLightRadioButton.checked
                         || pointLightRadioButton.checked
                         || directionalLightRadioButton.checked)

            Slider {
                id: distanceYSlider
                x: 6
                y: 39
                width: 261
                height: 19
                to: 250
                from: -250
                value: 0
            }

            Text {
                id: distanceYText
                x: 6
                y: 0
                textFormat: Text.RichText
                text: qsTr("T<sub>Y</sub> = " + (distanceYSlider.value).toFixed(
                               0))
                font.pixelSize: 25
                font.bold: true
            }
        }

        Item {
            id: distanceZItem
            x: 56
            y: 274
            width: 275
            height: 72
            visible: lightSwitch.checked
                     && (spotLightRadioButton.checked
                         || pointLightRadioButton.checked
                         || directionalLightRadioButton.checked)

            Slider {
                id: distanceZSlider
                x: 6
                y: 39
                width: 261
                height: 19
                to: 250
                from: -250
                value: 0
            }

            Text {
                id: distanceZText
                x: 6
                y: 0
                textFormat: Text.RichText
                text: qsTr("T<sub>Z</sub> = " + (distanceZSlider.value).toFixed(
                               0))
                font.pixelSize: 25
                font.bold: true
            }
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

    states: [
        State {
            name: "Default"
            when: !lightSwitch.checked
            PropertyChanges {
                target: stateText
                text: qsTr("State: Default")
            }
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

            PropertyChanges {
                target: rotationSlider
                visible: lightSwitch.checked
                         && (directionalLightRadioButton.checked
                             || spotLightRadioButton.checked
                             || pointLightRadioButton.checked)
            }
        },

        State {

            name: "Spot Light"
            when: spotLightRadioButton.checked && lightSwitch.checked

            PropertyChanges {
                target: stateText
                text: qsTr("State: Spot Light")
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
        },

        State {
            name: "Point Light"
            when: pointLightRadioButton.checked && lightSwitch.checked
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
                target: greenscreen
                eulerRotation.y: -0.15702
            }
        },
        State {
            name: "Directional Light"
            when: directionalLightRadioButton.checked && lightSwitch.checked
            PropertyChanges {
                target: stateText
                text: qsTr("State: Directional Light")
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
        },
        State {
            name: "Lights On"
            when: lightSwitch.checked

            PropertyChanges {
                target: stateText
                text: qsTr("State: Lights On")
            }
            PropertyChanges {
                target: lightSourceItem
                visible: lightSwitch.checked
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
                target: stateText
                text: qsTr("State: Lights Off")
            }
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
D{i:19}D{i:26}D{i:28}D{i:30}
}
##^##*/

