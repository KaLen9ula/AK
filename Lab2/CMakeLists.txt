cmake_minimum_required(VERSION 3.16.3)

project("Lab2_AK-2" VERSION 0.1.0)
 
add_library(mycalculator STATIC calculator.cpp)
add_executable("${PROJECT_NAME}" main.cpp)
target_link_libraries("${PROJECT_NAME}" mycalculator)
