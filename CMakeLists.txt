cmake_minimum_required(VERSION 3.10)  # Specify the minimum version of CMake required
set(CMAKE_CXX_STANDARD)

project(Myproject)  # Name your project

# Create an executable from the specified source file
add_executable(MyExecutable src/main.cpp)