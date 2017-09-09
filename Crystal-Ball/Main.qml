import QtQuick 2.9
import QtQuick.Controls 2.2

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"
    id: rootView

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "crystal-ball.arc676"

    width: units.gu(100)
    height: units.gu(75)

    property real sideMargin: units.gu(2)

    function getAnswer() {
        var index = parseInt(Math.random() * 12)
        switch (index) {
        case 0:
            return qsTr("Yes")
        case 1:
            return qsTr("No")
        case 2:
            return qsTr("Maybe")
        case 3:
            return qsTr("Try asking again later")
        case 4:
            return qsTr("Definitely")
        case 5:
            return qsTr("Of course not")
        case 6:
            return qsTr("Sure")
        case 7:
            return qsTr("Nope")
        case 8:
            return qsTr("Why not?")
        case 9:
            return qsTr("I wouldn't bet on it")
        case 10:
            return qsTr("You bet!")
        case 11:
            return qsTr("Don't hold your breath")
        }
    }

    Page {
        header: PageHeader {
            id: pageHeader
            title: i18n.tr("Crystal Ball")
            StyleHints {
                foregroundColor: UbuntuColors.orange
                backgroundColor: UbuntuColors.porcelain
                dividerColor: UbuntuColors.slate
            }
        }

        Label {
            id: label
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: pageHeader.bottom
                topMargin: sideMargin
                leftMargin: sideMargin
                left: parent.left
            }
            text: qsTr("Enter yes/no question")
        }

        TextField {
            id: questionField
            anchors {
                top: label.bottom
                topMargin: units.gu(2)
                left: parent.left
                leftMargin: sideMargin
                right: parent.right
                rightMargin: sideMargin
            }
        }

        Button {
            id: askbutton
            anchors {
                top: questionField.bottom
                topMargin: units.gu(2)
                left: parent.left
                leftMargin: sideMargin
                right: parent.right
                rightMargin: sideMargin
            }
            text: qsTr("Ask question")
            onClicked: {
                transcript.text = transcript.text + "\nQ: " + questionField.text + "\nA: " + getAnswer()
                questionField.text = ""
            }
        }

        TextArea {
            id: transcript
            anchors {
                top: askbutton.bottom
                topMargin: sideMargin
                left: parent.left
                leftMargin: sideMargin
                right: parent.right
                rightMargin: sideMargin
            }
            height: rootView.height - questionField.height - clear.height - askbutton.height - label.height - pageHeader.height - about.height - 7 * sideMargin
            width: rootView.width - 2 * sideMargin
            readOnly: true
            text: qsTr("Crystal Ball Transcript")
        }

        Button {
            id: clear
            anchors {
                top: transcript.bottom
                topMargin: sideMargin
                left: parent.left
                leftMargin: sideMargin
                right: parent.right
                rightMargin: sideMargin
            }
            text: qsTr("Clear transcript")
            onClicked: {
                transcript.text = qsTr("Crystal Ball Transcript")
            }
        }

        Button {
            id: about
            anchors {
                top: clear.bottom
                topMargin: sideMargin
                left: parent.left
                leftMargin: sideMargin
                right: parent.right
                rightMargin: sideMargin
            }
            text: qsTr("About Crystal Ball")
            onClicked: {
                var component = Qt.createComponent("About.qml")
                var window = component.createObject(rootView)
                window.show()
            }
        }
    }
}
