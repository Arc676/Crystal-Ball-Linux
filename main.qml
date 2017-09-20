import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3


ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Crystal Ball"
    id: rootView

    property real sideMargin: 2

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
        id: page
        anchors.fill: parent

        Label {
            id: label
            anchors {
                top: parent.top
                topMargin: sideMargin
            }
            text: qsTr("Enter yes/no question")
            anchors.right: parent.right
            anchors.rightMargin: 2
            anchors.left: parent.left
            anchors.leftMargin: 2
        }

        TextField {
            id: questionField
            x: 4
            height: 40
            anchors.right: parent.right
            anchors.rightMargin: 2
            anchors.top: label.bottom
            anchors.topMargin: 2
            anchors.left: parent.left
            anchors.leftMargin: 2
        }

        Button {
            id: askbutton
            anchors {
                top: questionField.bottom
                topMargin: sideMargin
                left: parent.left
                leftMargin: sideMargin
                right: parent.right
            }
            text: qsTr("Ask question")
            anchors.rightMargin: 2
            onClicked: {
                transcript.append("Q: " + questionField.text + "\nA: " + getAnswer())
                questionField.text = ""
            }
        }

        Flickable {
            id: flickable
            height: 289
            anchors.right: parent.right
            anchors.rightMargin: 2
            anchors.left: parent.left
            anchors.leftMargin: 2
            anchors.top: askbutton.bottom
            anchors.topMargin: 2

            TextArea.flickable:
            TextArea {
                id: transcript
                readOnly: true
                text: qsTr("Crystal Ball Transcript")
                anchors.fill: parent
                wrapMode: Text.WordWrap
                onTextChanged: {
                    if (transcript.height > flickable.height) {
                        flickable.contentY = transcript.height - flickable.height
                    }
                }
            }
        }

        Button {
            id: clear
            anchors {
                top: flickable.bottom
                left: parent.left
                leftMargin: sideMargin
                right: parent.right
            }
            text: qsTr("Clear transcript")
            anchors.topMargin: 2
            anchors.rightMargin: 2
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
            }
            text: qsTr("About Crystal Ball")
            anchors.rightMargin: 2
            onClicked: {
                var component = Qt.createComponent("About.qml")
                var window = component.createObject(rootView)
                window.show()
            }
        }

    }

}
