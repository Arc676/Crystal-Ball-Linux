import QtQuick 2.4
import Ubuntu.Components 1.3

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "crystal-ball.arc676"

    width: units.gu(100)
    height: units.gu(75)

    property real sideMargin: units.gu(2)

    function getAnswer() {
        var index = 0
        switch (index) {
        case 0:
            return qsTr("Yes")
        case 1:
            return qsTr("No")
        case 2:
            return qsTr("Maybe")
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

        Button {
            id: askbutton
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: label.bottom
                topMargin: units.gu(2)
            }
            width: parent.width
            text: qsTr("Ask question")
            onClicked: {
                var text = transcript.text
                text += "\n" + getAnswer()
                transcript.text = text
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
        }
    }
}
