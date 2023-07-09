# 设置 Qt 的 cmake 文件目录
set(QT_CMAKE_DIR "H:/Software/Qt/6.5.1/msvc2019_64/lib/cmake/Qt6")


# 寻找Qt6的Quick组件
find_package(Qt6 6.5 REQUIRED COMPONENTS Core Gui Quick PATHS ${QT_CMAKE_DIR})

# 寻找Qt6的测试组件
find_package(Qt6 6.5 REQUIRED COMPONENTS QuickTest)

# 设置Qt6项目
qt_standard_project_setup(REQUIRES 6.5)
