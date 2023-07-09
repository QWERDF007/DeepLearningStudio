
# 设置cmake最低版本
cmake_minimum_required(VERSION 3.16)

# 设置项目名称和版本号
set(PROJECT_NAME "DeepLearningStudio")

project(${PROJECT_NAME}
        LANGUAGES C CXX
        VERSION 0.1.0
        DESCRIPTION "DeepLearning Studio for Labeling and Training"
)

cmake_policy(SET CMP0099 NEW)

if(NOT CMAKE_CUDA_HOST_COMPILER)
    set(CMAKE_CUDA_HOST_COMPILER "${CMAKE_CXX_COMPILER}")
endif()

enable_language(CUDA)


# 是否编译测试用例
option(BUILD_TESTS "Enable testsuite" ON)
# 是否编译文档
option(BUILD_DOCS "Build Doc" ON)


# Configure build tree ======================
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake" )

include(ConfigBuildTree)
include(ConfigCompiler)
include(ConfigQT)
include(ConfigCUDA)

# Define the build tree ====================
add_subdirectory(3rdparty EXCLUDE_FROM_ALL)
add_subdirectory(src)

if(BUILD_TESTS)
    add_subdirectory(tests)
endif()



# # 安装目标
# install(TARGETS ${PROJECT_NAME}
#     BUNDLE DESTINATION .
#     LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})



# 打印构建配置
message(STATUS "")
include(PrintConfig)
