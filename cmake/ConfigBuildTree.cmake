# 设置 DEBUG 的编译后缀
set(CMAKE_DEBUG_POSTFIX "d")

# 设置默认编译 Release
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

# 设置编译输出目录
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

# set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)
# set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)
include(GNUInstallDirs)

set(CMAKE_INSTALL_LIBDIR "lib/${CMAKE_LIBRARY_ARCHITECTURE}")
set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR})

# Executables try to find libnvvpi library relative to themselves.
set(CMAKE_BUILD_RPATH_USE_ORIGIN true)

# Whether assert dumps expose code
if(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(DEFAULT_EXPOSE_CODE OFF)
else()
    set(DEFAULT_EXPOSE_CODE ON)
endif()

option(EXPOSE_CODE "Expose in resulting binaries parts of our code" ${DEFAULT_EXPOSE_CODE})

# 设置是否将警告当作错误
option(WARNINGS_AS_ERRORS "Treat compilation warnings as errors" OFF)
option(ENABLE_COMPAT_OLD_GLIBC "Generates binaries that work with old distros, with old glibc" ON)

# Needed to get cuda version
find_package(CUDAToolkit REQUIRED)

# 是否处于一个 git 仓库并且它有子模块
if(EXISTS ${CMAKE_SOURCE_DIR}/.git AND EXISTS ${CMAKE_SOURCE_DIR}/.gitmodules)
    if(NOT EXISTS ${CMAKE_SOURCE_DIR}/.git/modules)
        message(FATAL_ERROR "git submodules not initialized. Did you forget to run 'git submodule update --init'?")
    endif()
endif()

if(UNIX)
    set(SYSTEM_NAME "x86_64-linux")
elseif(WIN32)
    set(SYSTEM_NAME "x86_64-windows")
else()
    message(FATAL_ERROR "Architecture not supported")
endif()

set(BUILD_SUFFIX "cuda${CUDAToolkit_VERSION_MAJOR}-${SYSTEM_NAME}")

# 创建一个函数 `setup_dso`，接收两个参数 `target` 和 `version`
# 设置版本号和减少可执行文件的大小
function(setup_dso target version)
    # 使用正则表达式从 ${version} 中提取数字，存储到 ${version_list} 中
    string(REGEX MATCHALL "[0-9]+" version_list "${version}")

    # 从 ${version_list} 中获取索引 0 的值，存储到 ${VERSION_MAJOR} 中
    list(GET version_list 0 VERSION_MAJOR)
    list(GET version_list 1 VERSION_MINOR)
    list(GET version_list 2 VERSION_PATCH)

    # 设置 ${target} 的属性
    # VERSION 指定目标版本为 ${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}
    # SOVERSION 指定动态库版本为 ${VERSION_MAJOR}
    set_target_properties(${target} PROPERTIES
        VERSION "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}"
        SOVERSION "${VERSION_MAJOR}"
    )

    # 减少可执行文件大小

    # 为 ${target} 添加链接器选项
    # 移除未使用的代码、检查未定义符号、删除未使用的部分以及按需链接
    target_link_options(${target} PRIVATE -Wl,--exclude-libs,ALL -Wl,--no-undefined -Wl,--gc-sections -Wl,--as-needed)

    # 添加编译选项，将每个函数和数据放入单独的链接器部分，删除未使用的函数和数据对象
    target_compile_options(${target} PRIVATE -ffunction-sections -fdata-sections)

    # # 添加静态链接库，libstdc++ 和 libgcc
    # target_link_libraries(${target} PRIVATE
    # -static-libstdc++
    # -static-libgcc
    # )

    # 配置符号可见性，控制目标中符号的可见性，以减小可执行文件的大小并提高链接速度
    # VISIBILITY_INLINES_HIDDEN 用于控制内联函数的可见性，设置为 on，内联函数的可见性将被设置为隐藏
    # C_VISIBILITY_PRESET 和 CXX_VISIBILITY_PRESET 分别用于控制 C 和 C++ 语言符号的可见性
    # CUDA_VISIBILITY_PRESET 用于控制 CUDA 符号的可见性
    set_target_properties(${target} PROPERTIES VISIBILITY_INLINES_HIDDEN on
        C_VISIBILITY_PRESET hidden
        CXX_VISIBILITY_PRESET hidden
        CUDA_VISIBILITY_PRESET hidden)
endfunction()