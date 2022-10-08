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
        title: i18n.tr('UVK first prototype')
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
            text: 'Click me'
            verticalAlignment: Label.AlignVCenter
            horizontalAlignment: Label.AlignHCenter
            
            //create an area for handling mouse events
            MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            
            onPressed: {
                //connect and execute the speak function
                python.call('wall_view.speak', ['UVK test'], function ( result ) {
                label1.text=result;
                });
            }
            }
        }
    }

//declare a variable to import a Python module
    Python {
        id: python
        //connect example.py
        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('../src/'));
            importModule_sync("wall_view")
            importModule_sync("")
        } 
        onError: {
            console.log('python error: ' + traceback);
        }          
    }
}
