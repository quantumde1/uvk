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

#include "friends.h"

Friends::Friends(QObject *parent) : RequestBase(parent)
{}

void Friends::get(int userId) {
    QUrlQuery query;
    query.addQueryItem("user_id", QString::number(userId));
    query.addQueryItem("order", "hints");
    query.addQueryItem("fields", "photo_50,online,status");
    _api->makeApiGetRequest("friends.get", query, ApiRequest::FRIENDS_GET);
}

void Friends::getOnline(int userId) {
    QUrlQuery query;
    query.addQueryItem("user_id", QString::number(userId));
    _api->makeApiGetRequest("friends.getOnline", query, ApiRequest::FRIENDS_GET_ONLINE);
}

void Friends::getMutual(int userId) {
    QUrlQuery query;
    query.addQueryItem("target_uid", QString::number(userId));
    _api->makeApiGetRequest("friends.getMutual", query, ApiRequest::FRIENDS_GET_MUTUAL);
}
