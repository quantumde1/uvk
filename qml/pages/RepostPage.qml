 
 import QtQuickControls 2.7
import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
Dialog {

    property string type: "wall"
    property int sourceId: 0
    property int postId: 0

    DialogHeader {
        id: header
        acceptText: qsTr("Share")
        cancelText: qsTr("Cancel")
    }

    Flickable {
        id: flick
        anchors.fill: parent
        anchors.topMargin: header.height
        clip: true

        TextArea {
            id: repostComment
            anchors.fill: parent
        }
    }

    onAccepted: {
        vksdk.wall.repost(type, sourceId, postId, repostComment.text)
    }
}
