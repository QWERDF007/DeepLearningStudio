#pragma once

#include <QObject>
#include <QtQml>

class QuickTools : public QObject
{
    Q_OBJECT

    /**
     * 在 QML 声明本类为单例
     */
    QML_SINGLETON

    /**
     * 在 QML 中通过 QuickTools 可访问本单例
     */
    QML_NAMED_ELEMENT(QuickTools)

public:

    /**
     * @brief 获取单例实例的指针
     * @return
     */
    static QuickTools *getInstance();

    /**
     * @brief 提供给 QML 创建一个单例实例的静态工厂函数
     * @note QML engine 获取所有权并负责删除
     * @param qmlEngine
     * @param jsEngine
     * @return
     */
    static QuickTools* create(QQmlEngine *qmlEngine, QJSEngine *jsEngine)
    {
        // Create the instance using some custom constructor or factory.
        // The QML engine will assume ownership and delete it, eventually.
        return getInstance();
    }


    Q_INVOKABLE bool isMacos();

    Q_INVOKABLE bool isLinux();

    Q_INVOKABLE bool isWindows();

    Q_INVOKABLE bool setCursor(QObject *obj, const QString& source);

private:
    explicit QuickTools(QObject *parent = nullptr);

    /**
     * 禁用拷贝和移动构造和运算符
     */
    Q_DISABLE_COPY_MOVE(QuickTools)


    /**
     * @brief 单例实例指针
     */
    static QuickTools* instance_;
};
