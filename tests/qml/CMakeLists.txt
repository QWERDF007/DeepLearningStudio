set(TEST_NAME "ComponentsTest")
enable_testing()

# 在 shadow builds 中，不需要复制 qml 测试文件，只需要设置相应的定义
# 将 QUICK_TEST_SOURCE_DIR 设置为当前目录
add_definitions(-DQUICK_TEST_SOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}")

# ADD_CUSTOM_TARGET SOURCES 可以将文件添加到源码当不编译它们，类似在编译器添加一个文件夹
file(GLOB_RECURSE QML_FILES *.qml)
add_custom_target(qmlfiles SOURCES ${QML_FILES})

add_executable(${TEST_NAME} tst_abcd.cpp)
add_test(NAME ${TEST_NAME} COMMAND ${TEST_NAME})

target_link_libraries(${TEST_NAME} PRIVATE Qt6::QuickTest)
