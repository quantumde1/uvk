/*
 * Copyright (C) 2022  hui
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * hui is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <QtQml>
#include <QtQml/QQmlContext>

#include "plugin.h"
#include "example.h"
#include "vksdk.h"
#include "longpoll.h"
#include "authorization.h"
void ExamplePlugin::registerTypes(const char *uri) {
    //@uri Example
    qmlRegisterSingletonType<Example>(uri, 1, 0, "Example", [](QQmlEngine*, QJSEngine*) -> QObject* { return new Example; });
    qmlRegisterSingletonType<VkSDK>(uri, 1, 0, "VKsdk", [](QQmlEngine*, QJSEngine*) -> QObject* { return new VkSDK; });
    qmlRegisterSingletonType<LongPoll>(uri, 1, 0, "LongPoll", [](QQmlEngine*, QJSEngine*) -> QObject* { return new LongPoll; });
    qmlRegisterSingletonType<Authorization>(uri, 1, 0, "Auth", [](QQmlEngine*, QJSEngine*) -> QObject* { return new Authorization; });
}
