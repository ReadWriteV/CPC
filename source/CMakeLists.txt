add_subdirectory(front_driver)
add_subdirectory(syntax_tree)

add_executable(cpc main.cpp)

target_link_libraries(cpc front_driver syntax_tree)