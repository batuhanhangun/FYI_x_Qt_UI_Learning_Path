

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.5
import QtQuick.Controls 6.5
import Qt_Design_Studio_2D_Demo

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    MyMainViewRectangle {
        id: mainViewRectangle
        //width: 1200
        // height: 850
        width: 1204
        height: 874
        anchors.verticalCenterOffset: 22
        anchors.leftMargin: 32
    }

    Item {
        id: mainControlButtonsItem
        x: 1388
        y: 108
        width: 482
        height: 185

        RoundButton {
            id: spaceRoundButton
            x: 266
            width: 166
            height: 84
            text: "Space"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            autoExclusive: true
            checkable: true
            anchors.rightMargin: 40
            font.weight: Font.Bold
            font.bold: true
            font.styleName: "Regular"
            font.pointSize: 25
        }

        RoundButton {
            id: lagoonRoundButton
            width: 166
            height: 84
            text: "Lagoon"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            autoExclusive: true
            checkable: true
            anchors.leftMargin: 40
            font.styleName: "Regular"
            font.weight: Font.Bold
            font.pointSize: 25
            font.bold: true
        }

        Button {
            id: clearButton
            x: 127
            y: -59
            width: 229
            height: 82
            text: qsTr("Clear Screen")
            autoExclusive: true
            checkable: true
            font.pointSize: 25
            font.bold: true
        }
    }

    Item {
        id: radioButtonItem
        x: 1360
        y: 382
        width: 433
        height: 292
        visible: spaceRoundButton.checked || lagoonRoundButton.checked

        RadioButton {
            id: catRadioButton
            y: 190
            text: qsTr("Cat")
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
            font.bold: true
            font.pointSize: 25
        }

        RadioButton {
            id: alienRadioButton
            text: qsTr("Alien")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.leftMargin: 20
            font.pointSize: 25
            font.bold: true
        }

        Image {
            id: catPreviewImage
            x: 259
            y: 168
            width: 100
            height: 100
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            source: "images/cat.png"
            anchors.bottomMargin: 10
            anchors.rightMargin: 20
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: alienPreviewImage
            x: 259
            width: 100
            height: 100
            anchors.right: parent.right
            anchors.top: parent.top
            source: "images/alien.png"
            anchors.topMargin: 10
            anchors.rightMargin: 20
            fillMode: Image.PreserveAspectFit
        }
    }

    Item {
        id: glassesItem
        x: 1355
        y: 723
        width: 527
        height: 95
        visible: spaceRoundButton.checked || lagoonRoundButton.checked

        Switch {
            id: glassesSwitch
            y: 16
            text: qsTr("Sunglasses")
            anchors.left: parent.left
            anchors.leftMargin: 20
            font.pointSize: 25
            font.bold: true
        }

        Image {
            id: glassesPreviewImage
            x: 376
            y: 8
            width: 131
            height: 94
            anchors.right: parent.right
            source: "images/sunglasses.png"
            anchors.rightMargin: 20
            fillMode: Image.PreserveAspectFit
        }
    }

    Item {
        id: anchorItem
        x: 1355
        y: 854
        width: 527
        height: 95
        visible: lagoonRoundButton.checked

        Image {
            id: anchorImage
            x: 410
            width: 109
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "images/anchor.png"
            anchors.topMargin: 20
            anchors.bottomMargin: 8
            anchors.rightMargin: 8
            fillMode: Image.PreserveAspectFit
        }

        Switch {
            id: anchorSwitch
            text: qsTr("Anchor")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
            anchors.topMargin: 20
            font.bold: true
            font.pointSize: 25
        }
    }

    Item {
        id: spaceShipItem
        x: 1355
        y: 854
        width: 527
        height: 95
        visible: spaceRoundButton.checked
        Image {
            id: spaceShipImage
            x: 410
            width: 109
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "images/spaceship.png"
            anchors.bottomMargin: 8
            anchors.topMargin: 20
            anchors.rightMargin: 8
            fillMode: Image.PreserveAspectFit
        }

        Switch {
            id: spaceShipSwitch
            text: qsTr("Spaceship")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            font.bold: true
            anchors.topMargin: 20
            font.pointSize: 25
            anchors.leftMargin: 20
        }
    }
    states: [
        State {
            name: "clicked"
        }
    ]
}
