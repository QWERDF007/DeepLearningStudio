
#include <QGuiApplication>
#include <QQmlApplicationEngine>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    /******注册单例******/
    qmlRegisterSingletonType(QUrl("qrc:/qt/qml/DeepLearningStudio/qml/Theme/Dark.qml"), "dl.studio.theme", 1, 0, "Theme");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    qDebug() << "qml import path list" << engine.importPathList();
    engine.loadFromModule("DeepLearningStudio", "Main");

    return app.exec();
}
