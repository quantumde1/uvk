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

Item {
    id: messageItem

    property var userId
    property var date
    property var isOut
    property var isRead
    property alias avatarSource: avatar.source
    property alias bodyText: body.text
    property var photos
    property var videos
    property var audios
    property var documents
    property var links
    property var news
    property var geoTile
    property var geoMap
    property var fwdMessages
    property bool highlighted: !(isRead || isOut)

    height: Math.max(avatar.height, content.height) + Theme.paddingLarge

    Switch {
        anchors.horizontalCenter: parent.left
        anchors.top: parent.top
        LayoutMirroring.enabled: isOut
        automaticCheck: false
        checked: !isRead
        visible: !isRead
    }

    Item {
        anchors.fill: parent
        anchors.leftMargin: Theme.horizontalPageMargin
        anchors.rightMargin: Theme.horizontalPageMargin

        Image {
            id: avatar
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: Theme.paddingMedium
            width: Theme.iconSizeMedium
            height: Theme.iconSizeMedium
            LayoutMirroring.enabled: isOut

            MouseArea {
                anchors.fill: parent
                onClicked: pageContainer.push(Qt.resolvedUrl("../pages/ProfilePage.qml"), { profileId: userId })
            }
        }

        Column {
            id: content
            anchors.left: avatar.right
            anchors.top: avatar.top
            anchors.leftMargin: Theme.paddingMedium
            spacing: Theme.paddingSmall
            LayoutMirroring.enabled: isOut

            Label {
                id: datetime
                width: body.width
                horizontalAlignment: Text.AlignLeft
                color: messageItem.highlighted || (!isRead && isOut) ? Theme.secondaryHighlightColor: Theme.secondaryColor
                font.pixelSize: Theme.fontSizeTiny
                LayoutMirroring.enabled: isOut
                text: convertUnixtimeToString(date)
                visible: text !== ""
            }

            Label {
                id: body
                width: messageItem.width - avatar.width - Theme.paddingMedium - 2 * Theme.horizontalPageMargin
                horizontalAlignment: Text.AlignLeft
                wrapMode: Text.Wrap
                textFormat: Text.StyledText
                color: messageItem.highlighted || (!isRead && isOut) ? Theme.highlightColor : Theme.primaryColor
                linkColor: messageItem.highlighted ? Theme.primaryColor : Theme.highlightColor
                LayoutMirroring.enabled: isOut
                visible: text !== ""

                onLinkActivated: Qt.openUrlExternally(link)
            }

            AttachmentsView {
                id: attachments
                width: parent.width
                ageoTile: geoTile
                ageoMap: geoMap
                aphotos: photos
                avideos: videos
                aaudios: audios
                adocuments: documents
                alinks: links
                anews: news
                amessages: fwdMessages
            }
        }
    }
}
