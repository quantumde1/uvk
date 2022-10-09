import QtQuick 2.7
import Ubuntu.Components 1.3

Rectangle {
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
}