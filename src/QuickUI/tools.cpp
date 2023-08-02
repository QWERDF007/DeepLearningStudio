#include "tools.h"

QuickTools::QuickTools()
{

}

QuickTools::~QuickTools()
{

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
