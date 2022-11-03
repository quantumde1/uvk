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

#include "group.h"

Group::Group(QObject *parent) : QObject(parent)
{}

Group *Group::fromJsonObject(QJsonObject object)
{
    Group *group = new Group();
    if (object.contains("id")) group->setId(object.value("id").toInt());
    if (object.contains("name")) group->setName(object.value("name").toString());
    if (object.contains("status")) group->setStatus(object.value("status").toString());
    if (object.contains("description")) group->setDescription(object.value("description").toString());
    if (object.contains("photo_50")) group->setPhoto50(object.value("photo_50").toString());
    if (object.contains("photo_100")) group->setPhoto100(object.value("photo_100").toString());
    if (object.contains("photo_200")) group->setPhoto200(object.value("photo_200").toString());
    if (object.contains("members_count")) group->setMembersCount(object.value("members_count").toInt());
    if (object.contains("counters")) {
        QJsonObject counters = object.value("counters").toObject();
        if (counters.contains("photos")) group->setPhotosCount(counters.value("photos").toInt());
        if (counters.contains("audios")) group->setAudiosCount(counters.value("audios").toInt());
        if (counters.contains("videos")) group->setVideosCount(counters.value("videos").toInt());
        if (counters.contains("topics")) group->setTopicsCount(counters.value("topics").toInt());
        if (counters.contains("docs")) group->setDocsCount(counters.value("docs").toInt());
    }
    return group;
}

int Group::id() const
{
    return _id;
}

void Group::setId(int id)
{
    _id = -id;
}

QString Group::name() const
{
    return _name;
}

void Group::setName(const QString &name)
{
    _name = name;
}

QString Group::photo50() const
{
    return _photo50;
}

void Group::setPhoto50(const QString &photo50)
{
    _photo50 = photo50;
}

QString Group::photo100() const
{
    return _photo100;
}

void Group::setPhoto100(const QString &photo100)
{
    _photo100 = photo100;
}

QString Group::photo200() const
{
    return _photo200;
}

void Group::setPhoto200(const QString &photo200)
{
    _photo200 = photo200;
}

QString Group::status() const
{
    return _status;
}

void Group::setStatus(const QString &status)
{
    _status = status;
}

QString Group::description() const
{
    return _description;
}

void Group::setDescription(const QString &description)
{
    _description = description;
}

int Group::photosCount() const
{
    return _photosCount;
}

void Group::setPhotosCount(int photosCount)
{
    _photosCount = photosCount;
}

int Group::audiosCount() const
{
    return _audiosCount;
}

void Group::setAudiosCount(int audiosCount)
{
    _audiosCount = audiosCount;
}

int Group::videosCount() const
{
    return _videosCount;
}

void Group::setVideosCount(int videosCount)
{
    _videosCount = videosCount;
}

int Group::topicsCount() const
{
    return _topicsCount;
}

void Group::setTopicsCount(int topicsCount)
{
    _topicsCount = topicsCount;
}

int Group::docsCount() const
{
    return _docsCount;
}

void Group::setDocsCount(int docsCount)
{
    _docsCount = docsCount;
}

int Group::membersCount() const
{
    return _membersCount;
}

void Group::setMembersCount(int membersCount)
{
    _membersCount = membersCount;
}

