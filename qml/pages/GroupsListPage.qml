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

 
 import QtQuickControls 2.0
import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import "../views"

Page {
    id: groupsListPage

    property var userId

    ListView {
        id: groupsListView
        anchors.fill: parent

        model: vksdk.groupsListModel

        header: PageHeader {
            title: qsTr("Groups")
        }

        delegate: UserListItem {
            isUser: false
            avatarSource: avatar
            titleText: name
            bodyText: status

            onClicked: pageContainer.push(Qt.resolvedUrl("GroupProfilePage.qml"), { groupId: id })
        }

        VerticalScrollDecorator {}
    }

    onStatusChanged: if (status === PageStatus.Active) {
                         pageStack.pushAttached(Qt.resolvedUrl("AudioPlayerPage.qml"))
                         vksdk.groupsListModel.clear()
                         vksdk.groups.get(userId)
                     }
}
