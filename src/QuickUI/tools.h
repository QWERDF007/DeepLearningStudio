#pragma once

#include <QObject>
#include <QtQml>

class QuickTools : public QObject
{
    Q_OBJECT
    QML_NAMED_ELEMENT(QuickTools)
    QML_SINGLETON
public:
    QuickTools();
    ~QuickTools();

    Q_INVOKABLE bool isMacos();

    Q_INVOKABLE bool isLinux();

    Q_INVOKABLE bool isWindows();
};
