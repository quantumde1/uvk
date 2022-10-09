import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import io.thp.pyotherside 1.3

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

                    var a = Qt.createComponent("login.qml")
                    if (a.status == Component.Ready) {
                        var login = a.createObject(root, {"x": 0, "y": 50});
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
    Python {
        id: python
        //connect example.py
        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('../src/'));
        } 
        onError: {
            console.log('python error: ' + traceback);
        }          
    }
}
