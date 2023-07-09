# 设置项目名称和版本号
set(PROJECT_NAME "DeepLearningStudioTest")

project(${PROJECT_NAME}
        LANGUAGES C CXX
        VERSION 0.1.0
        DESCRIPTION "DeepLearning Studio TestCase"
)

# enable_testing()

add_subdirectory(qml)