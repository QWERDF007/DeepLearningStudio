
# 将CUDA版本号分割成三个部分
string(REPLACE "." ";" CUDA_VERSION_LIST ${CMAKE_CUDA_COMPILER_VERSION})
# 获取CUDA主版本号
list(GET CUDA_VERSION_LIST 0 CUDA_VERSION_MAJOR)
# 获取CUDA次版本号
list(GET CUDA_VERSION_LIST 1 CUDA_VERSION_MINOR)
# 获取CUDA修订版本号
list(GET CUDA_VERSION_LIST 2 CUDA_VERSION_PATCH)

# 查找CUDA工具包
find_package(CUDAToolkit ${CUDA_VERSION_MAJOR}.${CUDA_VERSION_MINOR} REQUIRED)

# 如果CUDA版本小于11.1，则报错
if(CMAKE_CUDA_COMPILER_VERSION VERSION_LESS "11.1")
    message(FATAL_ERROR "Minimum CUDA version supported is 11.1")
endif()

# 设置CMAKE_CUDA_STANDARD
set(CMAKE_CUDA_STANDARD ${CMAKE_CXX_STANDARD})

# 压缩内核以生成更小的可执行文件
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -Xfatbin=--compress-all")

# 如果未使用CMAKE_CUDA_ARCHITECTURES，则设置CMAKE_CUDA_ARCHITECTURES
if(NOT USE_CMAKE_CUDA_ARCHITECTURES)
    set(CMAKE_CUDA_ARCHITECTURES "$ENV{CUDAARCHS}")

    # 如果启用了TEGRA，则添加以下架构
    if(ENABLE_TEGRA)
        list(APPEND CMAKE_CUDA_ARCHITECTURES
            72-real # Volta  - gv11b/Tegra (Jetson AGX Xavier)
            87-real # Ampere - ga10b,ga10c/Tegra (Jetson AGX Orin)
        )
    else()
        # 添加以下架构
        list(APPEND CMAKE_CUDA_ARCHITECTURES
             70-real # Volta  - gv100/Tesla
             75-real # Turing - tu10x/GeForce
             80-real # Ampere - ga100/Tesla
             86-real # Ampere - ga10x/GeForce
        )

        # 如果CUDA版本大于等于11.8，则添加以下架构
        if(CMAKE_CUDA_COMPILER_VERSION VERSION_GREATER_EQUAL "11.8")
            list(APPEND CMAKE_CUDA_ARCHITECTURES
                89-real # Ada    - ad102/GeForce
                90-real # Hopper - gh100/Tesla
            )
        endif()
    endif()

    # 设置所需的计算能力
    # * compute_70: fast fp16 support + PTX for forward compatibility
    list(APPEND CMAKE_CUDA_ARCHITECTURES 70-virtual)

    # 设置缓存以正确的值，否则cmake将写入其默认值，那是nvcc支持的旧架构。我们不想要那个。
    set(CMAKE_CUDA_ARCHITECTURES "${CMAKE_CUDA_ARCHITECTURES}" CACHE STRING "CUDA architectures to build for" FORCE)
endif()

# 设置CUDA_ROOT和CUDA_INCLUDE_DIRS
set(CUDA_ROOT ${CUDAToolkit_TARGET_DIR})
set(CUDA_INCLUDE_DIRS ${CUDAToolkit_INCLUDE_DIRS})

# 查找cudnn库
find_library(CUDNN_LIB cudnn HINTS
    ${CUDA_TOOLKIT_ROOT_DIR} ${CUDNN_ROOT_DIR} PATH_SUFFIXES lib64 lib/x64 lib)


