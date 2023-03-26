cmake_minimum_required(VERSION 3.22)
project(os_unix_sparse_file C)

set(CMAKE_C_STANDARD 23)

add_executable(sparse_file main.c )
add_executable(test_file_creator.c test_file_creator.c)
