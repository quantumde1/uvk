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

#ifndef WALL_H
#define WALL_H

#include "requestbase.h"

class Wall : public RequestBase
{
    Q_OBJECT
public:
    explicit Wall(QObject *parent = 0);

    Q_INVOKABLE void get(int ownerId, int offset = 0);
    Q_INVOKABLE void getById(int ownerId, int id);
    Q_INVOKABLE void getComments(int ownerId, int postId, int offset = 0);
    Q_INVOKABLE void createComment(int ownerId, int postId, const QString &message);
    Q_INVOKABLE void repost(const QString &type, int ownerId, int postId, const QString &message);
};

#endif // WALL_H
