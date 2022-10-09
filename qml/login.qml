import QtQuick 2.7
import Ubuntu.Components 1.3

import io.thp.pyotherside 1.3

Rectangle {
    id: login_page
    y: units.dp(45)
    x: 0
    TextField {
        id: phoneInput
        x: units.dp(75)
        y: units.dp(15)
        placeholderText: i18n.tr("Enter your phone number")
    }
    TextField {
        id: passwordInput
        x: units.dp(75)
        y: units.dp(55)
        placeholderText: i18n.tr("Enter your password")
        echoMode: TextInput.Password
    }

    Button {
        x: units.dp(120)
        y: units.dp(95)
        text: "Login"
        onClicked: python.call("login.login", [phoneInput.text, passwordInput.text], ret=>{
            
        })
    }

    Python {
        id: python
        //connect example.py
        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('../src/'));
            importModule_sync("login")  
        } 
        onError: {
            console.log('python error: ' + traceback);
        }          
    }
}