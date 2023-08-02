#pragma once

#include <QObject>
#include <QtQml>

class QuickTheme : public QObject
{
    Q_OBJECT
    QML_NAMED_ELEMENT(QuickTheme)
    QML_SINGLETON
public:
    static QuickTheme* getInstance();

    static QuickTheme* create(QQmlEngine *qmlEngine, QJSEngine *jsEngine)
    {
        return getInstance();
    }

private:
    explicit QuickTheme(QObject *parent = nullptr);

    Q_DISABLE_COPY_MOVE(QuickTheme)
};
