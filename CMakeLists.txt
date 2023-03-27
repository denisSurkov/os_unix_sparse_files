cmake_minimum_required(VERSION 3.22)
project(os_unix_sparse_file C)

set(CMAKE_C_STANDARD 23)

add_executable(sparse_file src/main.c src/main.h src/sparse_file_processor.c src/sparse_file_processor.h)
add_executable(test_file_creator src/test_file_creator.c)
