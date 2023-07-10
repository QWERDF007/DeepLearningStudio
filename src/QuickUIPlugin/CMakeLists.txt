cmake_minimum_required(VERSION 3.16)

set(PROJECT_NAME "QuickUI")

project(${PROJECT_NAME}
        LANGUAGES C CXX
        VERSION 0.1.0
        DESCRIPTION "Qt Quick UI Plugin"
)

# 设置插件输出目录 ${CMAKE_BINARY_DIR}/plugin
set(QML_PLUGIN_DIRECTORY ${CMAKE_BINARY_DIR}/${PROJECT_NAME})

#配置通用编译
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 寻找Qt6 CMake依赖
find_package(Qt6 REQUIRED COMPONENTS Core Quick Qml)

# 获取所有QML文件的相对路径
file(GLOB QML_SOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.qml)  

# 添加qml模块
# TODO: 使用动态库
qt_add_library(${PROJECT_NAME} STATIC)
qt_add_qml_module(${PROJECT_NAME}
    # 没有下面这行代码就会生成 QuickUIPlugin.dll 与 QuickUIPluginplugin.dll 两个动态库
#    PLUGIN_TARGET ${PROJECT_NAME}
    OUTPUT_DIRECTORY ${QML_PLUGIN_DIRECTORY}
    VERSION 1.0
    URI ${PROJECT_NAME}
    # 修改qmltypes文件名称。默认 QuickUIPlugin.qmltypes，使用默认名称有时候import QuickUIPlugin 会爆红，所以修改成plugins.qmltypes
    TYPEINFO "plugins.qmltypes"
    # SOURCES ${sources_files} fluentui.rc
    QML_FILES ${QML_SOURCES}
    # RESOURCES ${resource_files}
)

# 设置目标属性
set_target_properties(${PROJECT_NAME} PROPERTIES
    MACOSX_BUNDLE FALSE
    WIN32_EXECUTABLE TRUE
) 

# 如果编译模式是Debug或RelWithDebInfo，则添加预处理定义QT_QML_DEBUG。用于开启Qt Quick调试功能
target_compile_definitions(${PROJECT_NAME}
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE Qt6::Quick
)

# 安装
install(DIRECTORY ${QML_PLUGIN_DIRECTORY} DESTINATION ${CMAKE_INSTALL_PREFIX}/imports)
