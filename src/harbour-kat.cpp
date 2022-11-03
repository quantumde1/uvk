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

#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif
#include <QGuiApplication>
#include <QCoreApplication>
#include <QUrl>
#include <QString>
#include <QQuickView>
#include <QStandardPaths>
#include <QQmlContext>
#include <QScopedPointer>
#include <QtGlobal>

#include <stdio.h>
#include <stdlib.h>

#include "./filesaver.h"
#include "./mediaplayerwrapper.h"
#include "./settingswrapper.h"
#include "../plugins/Example/vksdk.h"

/*void myMessageOutputt(QtMsgType type, const char *msg)
 {

   // QByteArray localMsg = msg.toLocal8Bit();
    QFile fileOut("/home/defaultuser/log.txt");
        if(fileOut.open(QIODevice::Append | QIODevice::Text))
        {
            fileOut.write(msg);
            fileOut.flush();
            fileOut.close();
    }

 }*/


void myMessageOutput(QtMsgType type, const QMessageLogContext &context, const QString &msg)
{
    Q_UNUSED(type);
    Q_UNUSED(context);
    Q_UNUSED(msg);
    QByteArray localMsg = msg.toLocal8Bit();
    //switch (type) {
    /*case QtDebugMsg:
        fprintf(stderr, "Debug: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        break;
    case QtInfoMsg:
        fprintf(stderr, "Info: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        break;
    case QtWarningMsg:
        fprintf(stderr, "Warning: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        break;
    case QtCriticalMsg:
        fprintf(stderr, "Critical: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        break;
    case QtFatalMsg:
        fprintf(stderr, "Fatal: %s (%s:%u, %s)\n", localMsg.constData(), context.file, context.line, context.function);
        abort();
    }*/
}


int main(int argc, char *argv[]) {
    QGuiApplication *application = new QGuiApplication(argc, (char**)argv);
    application->setOrganizationName(QStringLiteral("org.quantumde"));
    application->setApplicationName(QStringLiteral("kat-ut"));
    qInstallMessageHandler(myMessageOutput);
    QQuickView *view = new QQuickView();
    QScopedPointer<FileSaver> fileSaver(new FileSaver(view.data()));
    view->rootContext()->setContextProperty("fileSaver", fileSaver.data());

    QScopedPointer<MediaPlayerWrapper> player(new MediaPlayerWrapper(view.data()));
    view->rootContext()->setContextProperty("player", player.data());

    QScopedPointer<SettingsWrapper> settings(new SettingsWrapper(view.data()));
    view->rootContext()->setContextProperty("settings", settings.data());

    QScopedPointer<VkSDK> vksdk(new VkSDK(view.data()));
    view->rootContext()->setContextProperty("vksdk", vksdk.data());

    view->setSource(QUrl("qrc:/harbour-cat.qml"));
    view->show();

    return application->exec();
}
