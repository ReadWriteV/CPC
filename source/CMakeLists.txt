add_subdirectory(front)

add_executable(cpc main.cpp)

target_link_libraries(cpc front)