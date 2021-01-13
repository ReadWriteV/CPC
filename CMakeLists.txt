cmake_minimum_required(VERSION 3.19.2)

project(CPC)

set(FLEX_EXECUTABLE D:/SDK/win_flex_bison-2.5.24/win_flex.exe)
set(BISON_EXECUTABLE D:/SDK/win_flex_bison-2.5.24/win_bison.exe)

set(FLEX_INCLUDE_DIR D:/SDK/win_flex_bison-2.5.24)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

find_package(FLEX REQUIRED)
find_package(BISON REQUIRED)

include_directories(include ${FLEX_INCLUDE_DIRS})
include_directories(include/front)
include_directories(${CMAKE_BINARY_DIR}/source/front)

add_subdirectory(source)