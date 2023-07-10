
add_subdirectory(QuickUIPlugin)

# 获取当前目录下所有 qml 文件, 添加到 QML_SOURCES 变量中
file(GLOB_RECURSE QML_SOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} qml/*.qml)
source_group("QML Files" FILES ${QML_SOURCES} "qtquickcontrols2.conf")

file(GLOB_RECURSE THEME_SOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} qml/Theme/*.qml)

set(SOURCES main.cpp)

qt_add_big_resources(QRC_SOURCES ../assets/assets.qrc)
# Have big_resource.qrc treated as a source file by Qt Creator
set_property(SOURCE ../assets/assets.qrc PROPERTY SKIP_AUTORCC ON)

# set_source_files_properties(${THEME_SOURCES} PROPERTIES
#     QT_QML_SINGLETON_TYPE TRUE
# )

# 添加可执行文件
qt_add_executable(${PROJECT_NAME}
    ${SOURCES}
    ${QRC_SOURCES}
)


# 添加QML模块
qt_add_qml_module(${PROJECT_NAME}
    URI DeepLearningStudio
    VERSION 1.0
    QML_FILES ${QML_SOURCES}
)

# 添加资源文件
qt_add_resources(${PROJECT_NAME} "controls_conf"
    PREFIX "/"
    FILES "qtquickcontrols2.conf"
)


# 添加 qml 导入目录
list(APPEND QML_IMPORT_PATH "${CMAKE_BINARY_DIR}/QuickUI")

# 去除重复
list(REMOVE_DUPLICATES QML_IMPORT_PATH)

# 将导入目录添加到 cache, 强制更新
set(QML_IMPORT_PATH ${QML_IMPORT_PATH}
    CACHE STRING "qml import paths"
    FORCE
)

# 如果编译模式是Debug或RelWithDebInfo，则添加预处理定义QT_QML_DEBUG。用于开启Qt Quick调试功能
target_compile_definitions(${PROJECT_NAME}
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
)

# 链接库
target_link_libraries(${PROJECT_NAME}
    PRIVATE Qt6::Quick
    PRIVATE QuickUIplugin
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)
