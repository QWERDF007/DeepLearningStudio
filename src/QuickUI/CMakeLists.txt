cmake_minimum_required(VERSION 3.16)

set(PROJECT_NAME "QuickUI")
set(PLUGIN_NAME "${PROJECT_NAME}plugin")

project(${PROJECT_NAME}
    LANGUAGES C CXX
    VERSION 0.1.0
    DESCRIPTION "Qt Quick UI Plugin"
)

# 设置插件输出目录 ${CMAKE_BINARY_DIR}/QuickUI
set(QML_PLUGIN_DIRECTORY "${CMAKE_BINARY_DIR}/${PROJECT_NAME}")


# 添加 qml 导入目录
# QML_IMPORT_PATH 用于支持语法高亮
list(APPEND QML_IMPORT_PATH ${CMAKE_BINARY_DIR})

# 去除重复
list(REMOVE_DUPLICATES QML_IMPORT_PATH)

# 将导入目录添加到 cache, 强制更新
set(QML_IMPORT_PATH ${QML_IMPORT_PATH}
    CACHE STRING "qml import paths"
    FORCE
)


#配置通用编译
set(CMAKE_CXX_STANDARD_REQUIRED ON)

cmake_policy(SET CMP0099 NEW)

# 寻找Qt6 CMake依赖
find_package(Qt6 REQUIRED COMPONENTS Core Quick Qml)

file(GLOB SOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.cpp *.h) 

# 获取所有QML文件的相对路径
file(GLOB_RECURSE QML_SOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.qml)
# 将 qml 文件组织到一起
source_group("QML Files" FILES ${QML_SOURCES})

# 添加qml模块
qt_add_library(${PLUGIN_NAME} SHARED
    ${SOURCES}
    ${QML_SOURCES}
)
qt_add_qml_module(${PLUGIN_NAME}
    # 没有下面这行代码就会生成 QuickUIplugin.dll 与 QuickUIpluginplugin.dll 两个动态库
    PLUGIN_TARGET ${PLUGIN_NAME}
    OUTPUT_DIRECTORY ${QML_PLUGIN_DIRECTORY}
    VERSION 1.0
    URI ${PROJECT_NAME}
    # 修改qmltypes文件名称。默认 QuickUIplugin.qmltypes，使用默认名称有时候import QuickUIplugin 会爆红，所以修改成plugins.qmltypes
    TYPEINFO "plugins.qmltypes"
    SOURCES ${SOURCES}
    QML_FILES ${QML_SOURCES}
    # RESOURCES ${resource_files}
)

# 设置目标属性
#set_target_properties(${PROJECT_NAME} PROPERTIES
#    MACOSX_BUNDLE FALSE
#    WIN32_EXECUTABLE TRUE
#)

# 如果编译模式是Debug或RelWithDebInfo，则添加预处理定义QT_QML_DEBUG。用于开启Qt Quick调试功能
target_compile_definitions(${PLUGIN_NAME}
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
)

target_link_libraries(${PLUGIN_NAME} PUBLIC
    Qt::CorePrivate
    Qt::QuickPrivate
)

# 下面这部分用于复制 dll 和 qmldir, 需要将 dll 和 qmldir 添加到 QQmlEngine::importPathList 中
# 否则无法使用插件, 默认会将可执行文件所在目录添加到列表中, 所以将插件拷贝到该目录下

# 创建目录
set(DLL_COPY_DIR ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME})
add_custom_command(TARGET ${PLUGIN_NAME}
    COMMAND ${CMAKE_COMMAND} -E make_directory
    ${DLL_COPY_DIR}
)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    list(APPEND DLL_FILES ${QML_PLUGIN_DIRECTORY}/${PLUGIN_NAME}${CMAKE_DEBUG_POSTFIX}.dll)
elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    list(APPEND DLL_FILES ${QML_PLUGIN_DIRECTORY}/${PLUGIN_NAME}${CMAKE_RELEASE_POSTFIX}.dll)
endif()

# 去除重复
list(REMOVE_DUPLICATES DLL_FILES)

set(QMLDIR_FILE ${QML_PLUGIN_DIRECTORY}/qmldir)
# 添加自定义命令, POST_BUILD: 指定目标其他规则执行完后执行, copy: 复制, copy_if_different: 输入有变则复制
add_custom_command(TARGET ${PLUGIN_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy
    ${DLL_FILES} ${QMLDIR_FILE}
    ${DLL_COPY_DIR}
)

# 安装
#install(DIRECTORY ${QML_PLUGIN_DIRECTORY} DESTINATION ${CMAKE_INSTALL_PREFIX}/imports)
