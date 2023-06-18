# 寻找Qt6的Quick组件
find_package(Qt6 6.5 REQUIRED COMPONENTS Core Gui Quick PATHS "H:/Software/Qt/6.5.0/msvc2019_64/lib/cmake/Qt6")

# 设置Qt6项目
qt_standard_project_setup(REQUIRES 6.5)