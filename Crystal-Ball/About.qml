import QtQuick 2.4
import Ubuntu.Components 1.3
import QtQuick.Controls 1.4

ApplicationWindow {
    id: aboutWindow

    width: units.gu(50)
    height: units.gu(40)

    TextArea {
        id: textarea
        readOnly: true
        text: i18n.tr("This project is available under GPLv3. See LICENSE for full GPL text. See the README for more details.")
        anchors.fill: parent
        height: parent.height - pageHeader.height
    }
}
