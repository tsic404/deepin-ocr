/*
* Copyright (C) 2020 ~ 2021 Deepin Technology Co., Ltd.
*
* Author: He MingYang Hao<hemingyang@uniontech.com>
*
* Maintainer: He MingYang <hemingyang@uniontech.com>
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

#include "mainwindow.h"
#include "mainwidget.h"
#include "service/dbusocr_adaptor.h"

#include <QLabel>
#include <QDBusConnection>
#include <DTitlebar>

MainWindow::MainWindow(QWidget *parent)
    : DMainWindow(parent)
{
    if (!m_mainWidget) {
        m_mainWidget = new MainWidget(this);
    }
    this->setCentralWidget(m_mainWidget);
}

MainWindow::~MainWindow()
{

}


bool MainWindow::openFile(const QString &filePaths)
{
    m_mainWidget->openImage(filePaths);
    return true;
}

bool MainWindow::openImage(const QImage &image)
{
    m_mainWidget->openImage(image);
    return true;
}
