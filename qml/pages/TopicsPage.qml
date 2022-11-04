 
 import QtQuickControls 2.7
import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
Page {

    property int ownerId

    ListView {
        id: topicsList
        anchors.fill: parent

        header: PageHeader { title: qsTr("Topics") }

        model: ListModel {}

        delegate: BackgroundItem {
            width: parent.width
            height: Theme.itemSizeSmall

            Label {
                anchors.centerIn: parent
                width: parent.width - 2 * Theme.horizontalPageMargin
                height: Theme.itemSizeSmall
                verticalAlignment: Text.AlignVCenter
                text: title
                color: highlighted ? Theme.highlightColor : Theme.primaryColor
                truncationMode: TruncationMode.Fade
            }

            onClicked: pageContainer.push(Qt.resolvedUrl("TopicPage.qml"), { ownerId: ownerId,
                                                                             topicId: id_,
                                                                             isClosed: isClosed,
                                                                             _title: title })
        }

        VerticalScrollDecorator {}
    }

    Connections {
        target: vksdk
        onGotTopics: {
//            topicsList.model.clear()
            for (var index in topics) {
                topicsList.model.append({ id_: ids[index], title: topics[index], isClosed: closed[index] })
            }
        }
    }

    Component.onCompleted: vksdk.board.getTopics(ownerId)
}
