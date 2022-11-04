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

 
 import QtQuickControls 2.7
import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import "../views"

Page {
    id: newfeedPage

    BusyIndicator {
       id: busyIndicator
       anchors.centerIn: parent
       size: BusyIndicatorSize.Large
       running: false
    }

    ListView {

        PullDownMenu {

            MenuItem {
                text: qsTr("Refresh newsfeed")
                onClicked: {
                vksdk.newsfeedModel.clear()
                vksdk.newsfeed.get()
                }
            }
        }

        id: newsfeed
        anchors.fill: parent
        model: vksdk.newsfeedModel

        header: PageHeader {
            title: qsTr("Newsfeed")
        }

        delegate: Component {

            Loader {
                property var _avatarSource: avatarSource
                property var _title: title
                property var __wallpost: wallpost
                width: parent.width
                source: "../views/WallItem.qml"
            }
        }

        VerticalScrollDecorator {}
    }

    onStatusChanged: if (status === PageStatus.Active) pageStack.pushAttached(Qt.resolvedUrl("DialogsListPage.qml"))

    Component.onCompleted: {
        //vksdk.newsfeedModel.clear()
        if  (vksdk.newsfeedModel.size<=0) {
        vksdk.newsfeedModel.clear()
        vksdk.newsfeed.get()
        }
    }
}

