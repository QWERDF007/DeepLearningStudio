#include <QDebug>

#include "color.h"

QuickColor * QuickColor::instance_ = nullptr;


/**
 * 注意不能使用返回静态变量的指针, 会报错 _CrtlsValidHeapPointer(block)
 */
QuickColor *QuickColor::getInstance()
{
    if (instance_ == nullptr)
    {
        instance_ = new QuickColor;
    }
    return instance_;
//    static QuickColor instace;
//    return &instace;
}

QuickColor::QuickColor(QObject *parent)
    : QObject(parent)
{
    Primary("#3D3D3D");
    HighLight("#009688");
    BackGround("#303030");
    BrightButton("#5A5A5A");
    DarkButton("#4E4E4E");
    Shadow("#222222");
}

QuickColor::~QuickColor()
{
    qDebug() << __FUNCTION__ << "deconstructor";
}
