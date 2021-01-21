cmake_minimum_required(VERSION 3.0)

project(CPC)

set(FLEX_DIR D:/SDK/win_flex_bison-2.5.24)
set(BISON_DIR D:/SDK/win_flex_bison-2.5.24)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

find_package(FLEX REQUIRED)
find_package(BISON REQUIRED)
# find_package(LLVM REQUIRED CONFIG)

include_directories(
    include
    include/front_driver
    include/syntax_tree
    ${FLEX_INCLUDE_DIRS}
    ${CMAKE_BINARY_DIR}/source/front_driver
    )

add_subdirectory(source)