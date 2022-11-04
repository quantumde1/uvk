
import QtMultimedia 5.0
import QtQuickControls 2.0
import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
ApplicationWindow
{
    id: application
@@ -42,7 +43,7 @@ ApplicationWindow
    _defaultPageOrientations: Orientation.All

    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    initialPage: {
    Page {
        if (settings.accessToken()) {

            if (vksdk.checkToken(settings.accessToken())) {
                vksdk.setAccessTocken(settings.accessToken())
                vksdk.setUserId(settings.userId())
            return Qt.createComponent(Qt.resolvedUrl("pages/MainMenuPage.qml"))
            } else {
            settings.removeAccessToken()
            settings.removeUserId()
            return Qt.createComponent(Qt.resolvedUrl("pages/LoginPage.qml"))
            }
        } else {
            return Qt.createComponent(Qt.resolvedUrl("pages/LoginPage.qml"))
        }
    }
}