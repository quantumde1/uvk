/*
  Copyright (C) 2016 Petr Vytovtov
  Contact: Petr Vytovtov <osanwe@protonmail.ch>
  All rights reserved.

  This file is part of Kat.

  Kat is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  Kat is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with Kat.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtMultimedia 5.0
import QtQuickControls 2.0
import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
MainView
{
    id: application
     //property alias mprisPlayer: mprisPlayer

    function convertUnixtimeToString(unixtime) {
        var d = new Date(unixtime * 1000)
        var month = d.getMonth() + 1
        var minutes = d.getMinutes() < 10 ? "0" + d.getMinutes() : d.getMinutes()
        return d.getDate() + "." + month + "." + d.getFullYear() + " " + d.getHours() + ":" + minutes
    }



    allowedOrientations: Orientation.All
    _defaultPageOrientations: Orientation.All

    cover: Qt.resolvedUrl("cover/CoverPage.qml")
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

