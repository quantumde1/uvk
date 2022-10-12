import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.11

import io.thp.pyotherside 1.3

GridLayout {
    id: login_page
    anchors.fill: parent
    columns: 1
    //y: units.dp(45)
    //x: 0
    Item {
        Layout.fillHeight: true
    }
    TextField {
        id: phoneInput
        anchors.horizontalCenter: parent.horizontalCenter
        placeholderText: i18n.tr("Enter your phone number")
    }
    TextField {
        id: passwordInput
        anchors.horizontalCenter: parent.horizontalCenter
        placeholderText: i18n.tr("Enter your password")
        echoMode: TextInput.Password
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Login"
        onClicked: python.call("login.login", [phoneInput.text, passwordInput.text], ret=>{
            python.call("post_wall.test", [ret,], ()=>{})
        })
    }
    Item {
        Layout.fillHeight: true
    }

    Python {
        id: python
        //connect example.py
        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('../src/'));
            importModule_sync("login") 
            importModule_sync("post_wall") 
        } 
        onError: {
            console.log('python error: ' + traceback);
        }          
    }
}