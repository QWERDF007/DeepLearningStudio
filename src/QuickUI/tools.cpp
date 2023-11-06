#include "tools.h"

#include <QQuickItem>
#include <QCursor>

QuickTools* QuickTools::instance_ = nullptr;

QuickTools::QuickTools(QObject *parent)
{

}


QuickTools *QuickTools::getInstance()
{
    if (instance_ == nullptr)
    {
        instance_ = new QuickTools;
    }
    return instance_;
}

bool QuickTools::isMacos()
{
#if defined(Q_OS_MACOS)
    return true;
#else
    return false;
#endif
}

bool QuickTools::isLinux()
{
#if defined(Q_OS_LINUX)
    return true;
#else
    return false;
#endif
}

bool QuickTools::isWindows()
{
#if defined(Q_OS_WIN)
    return true;
#else
    return false;
#endif
}

bool QuickTools::setCursor(QObject *obj, const QString &source)
{
    if (obj == nullptr)
    {
        return false;
    }
    QQuickItem *item = qobject_cast<QQuickItem*>(obj);
    if (item == nullptr)
    {
        return false;
    }
    item->setCursor(QCursor(QPixmap(source)));
    return true;
}
