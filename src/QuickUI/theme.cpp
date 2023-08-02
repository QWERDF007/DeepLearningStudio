#include "theme.h"

QuickTheme *QuickTheme::getInstance()
{
    static QuickTheme instance;
    return &instance;
}

QuickTheme::QuickTheme(QObject *parent)
    : QObject(parent)
{

}


