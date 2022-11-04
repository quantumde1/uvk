 
 import QtQuickControls 2.0
import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
Page {

    /**
     * The function removes access token and user id from the config file.
     */
    function logout() {
        settings.removeAccessToken()
        settings.removeUserId()
        pageContainer.replace(Qt.resolvedUrl("LoginPage.qml"))
    }


    Flickable {
        anchors.fill: parent
        contentHeight: content.height

       PullDownMenu {

        MenuItem {
            text: qsTr("Logout")
            onClicked: logout()
        }

         }

        Column {
            id: content
            width: parent.width

            PageHeader {
                title: qsTr("Settings")
            }

            TextSwitch {
                id: isOffile
                checked: settings.offlineStatus()
                text: qsTr("Be offline if possible")
                description: qsTr("Your status will be online only if you publish something on the wall or in the group.")

                onCheckedChanged: settings.setOfflineStatus(checked)
            }
        }
    }
}
