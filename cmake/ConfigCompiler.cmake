# 设置 C++ 编译器语言版本
# set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD 17)

# 指定在 RelWithDebInfo 构建类型下，C++ 编译器的编译选项
# 其中，-O3 表示启用最高级别的优化，-ggdb 表示生成供 GDB 调试器使用的调试信息
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELWITHDEBINFO} -O3 -ggdb")

# 同上，但是是 C 编译器的
set(CMAKE_C_FLAGS_RELWITHDEBINFO "${CMAKE_C_FLAGS_RELWITHDEBINFO} -O3 -ggdb")

# 如果定义了 WARNINGS_AS_ERRORS，则让 C 编译和 CUDA 编译器将所有警告都视为错误
if(WARNINGS_AS_ERRORS)
    set(C_WARNING_ERROR_FLAG "-Werror")
    set(CUDA_WARNING_ERROR_FLAG "-Werror all-warnings")
endif()

# 设置 ${C_WARNING_FLAGS}，用于设置编译警告选项
# -Wall：启用所有警告
# -Wno-unknown-pragmas：禁用未知的 #pragma 指令的警告
# -Wpointer-arith：当在没有定义大小的类型上进行指针运算时发出警告
# -Wmissing-declarations：当全局函数未声明时发出警告
# -Wredundant-decls：当同一作用域中有多个相同的声明时发出警告
# -Wmultichar：当使用多字符字符常量时发出警告
# -Wno-unused-local-typedefs：禁用未使用的局部 typedefs 的警告
# -Wunused：启用未使用代码的警告
if(UNIX)
    set(C_WARNING_FLAGS "-Wall -Wno-unknown-pragmas -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wmultichar -Wno-unused-local-typedefs -Wunused")
elseif(WIN32)
    # set(C_WARNING_FLAGS "-Wall")
endif()

# 设置 ${CXX_WARNING_FLAGS}，让编译器在发现未使用 override 关键字的虚函数重写时发出警告
if(UNIX)
    set(CXX_WARNING_FLAGS "-Wsuggest-override")
endif()

# 当编译器检测到比较表达式中的两个操作数始终相等或始终不等时，它会发出自相矛盾的比较警告
# 禁用自相矛盾的比较警告，因为可能是有意为之
if(UNIX)
    set(CUDA_WARNING_FLAGS "-Wno-tautological-compare")
endif()

# 设置 C 和 C++ 编译标志
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${C_WARNING_ERROR_FLAG} ${C_WARNING_FLAGS} ${CXX_WARNING_FLAGS}")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${C_WARNING_ERROR_FLAG} ${C_WARNING_FLAGS}")

# 设置 CUDA 编译标志
if(UNIX)
    set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} ${CUDA_WARNING_ERROR_FLAG} ${C_WARNING_FLAGS} ${CXX_WARNING_FLAGS} ${CUDA_WARNING_FLAGS}")
elseif(WIN32)
    set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} ${CUDA_WARNING_ERROR_FLAG} ${CUDA_WARNING_FLAGS}")
endif()

# 检查当前编译器是否支持链接时优化 (LTO)
# 链接时优化是一种编译器优化技术，它可以在链接阶段对整个程序进行优化，以提高性能。
# 但是，这种优化可能会增加编译时间，并且并非所有编译器都支持。
include(CheckIPOSupported)

# 检查LTO是否可用，并将结果存储在 ${LTO_SUPPORTED} 中
check_ipo_supported(RESULT LTO_SUPPORTED)

# 如果编译类型是 Release 或者 RelWithDebInfo，启用 LTO
if(CMAKE_BUILD_TYPE STREQUAL "Release" OR CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
    set(LTO_ENABLED ON)
else()
    set(LTO_ENABLED OFF)
endif()

# 运行时检查器可以帮助开发人员在运行时发现潜在问题并改进代码质量。
# 但是，它们可能会增加程序的运行时间和内存占用。因此，在发布版本中通常不会启用它们。
# 设置运行时检查器
# -fsanitize=address：启用地址检查器，用于检测内存访问错误
# -fsanitize-address-use-after-scope：启用使用后作用域检查器，用于检测在作用域结束后使用局部变量的错误
# -fsanitize=leak：启用内存泄漏检查器，用于检测内存泄漏
# -fsanitize=undefined：启用未定义行为检查器，用于检测未定义行为
# -fno-sanitize-recover=all：禁止在发现错误时恢复执行
# -static-liblsan：静态链接内存泄漏检查器库
# -static-libubsan：静态链接未定义行为检查器库
if(ENABLE_SANITIZER)
    set(COMPILER_SANITIZER_FLAGS
        -fsanitize=address
        -fsanitize-address-use-after-scope
        -fsanitize=leak
        -fsanitize=undefined
        -fno-sanitize-recover=all

        # not properly supported, see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64234
        # -static-libasan
        -static-liblsan
        -static-libubsan)

    # 将 ${COMPILER_SANITIZER_FLAGS} 中的 ";" 替换成 " "
    string(REPLACE ";" " " COMPILER_SANITIZER_FLAGS "${COMPILER_SANITIZER_FLAGS}")

    # 添加运行时检查器到编译标志
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COMPILER_SANITIZER_FLAGS}")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${COMPILER_SANITIZER_FLAGS}")
endif()
