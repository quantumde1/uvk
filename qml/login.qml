import QtQuick 2.7
import Ubuntu.Components 1.3

Rectangle {
    TextField {
        x: 75
        y: 15
        placeholderText: i18n.tr("Enter your phone number")
    }
    TextField {
        x: 75
        y: 55
        placeholderText: i18n.tr("Enter your password")
        echoMode: TextInput.Password
    }
}