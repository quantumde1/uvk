/*   cover: Qt.resolvedUrl("cover/CoverPage.qml")
    Page {
            return Qt.createComponent(Qt.resolvedUrl("pages/LoginPage.qml"))
    }
*/
import QtMultimedia 5.0
import QtQuickControls 2.0
import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'uvk.quantumdev'
    automaticOrientation: true
    width: units.gu(45)
    height: units.gu(75)

    Page {
        id:main
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('UVKontakte')
        }
        //create Label
        
        Label {
            id: label1
            anchors {
                top: header.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            text: 'Click at any place for login'
            //create an area for handling mouse events
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onPressed: {
                //connect and execute the speak function

                    var a = Qt.createComponent(Qt.resolvedUrl("pages/LoginPage.qml"))
                    if (a.status == Component.Ready) {
                        var login = a.createObject(main);
                        if (login == null) {
                            // Error Handling
                            console.log("Error creating object");
                        }
                        label1.destroy()
                    } else if (a.status == Component.Error) {
                        // Error Handling
                        console.log("Error loading component:", a.errorString());
                    }
                }
            }
        }
        // TextField {
        //     x: 0
        //     y: 50
        //     placeholderText: "Enter your phone number"
        // }
    }

//declare a variable to import a Python module
}