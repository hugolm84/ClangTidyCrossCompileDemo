cmake_minimum_required(VERSION 3.12)

# Find Clang-Tidy
if(WIN32)
    find_program(CLANG_TIDY_BIN NAMES "clang-tidy")
    execute_process(COMMAND ${CLANG_TIDY_BIN} "--version"
        OUTPUT_VARIABLE CMD_OUTPUT
    )
    if(NOT ${CMD_OUTPUT} MATCHES "9.0")
        message(FATAL_ERROR "Could not find Clang-Tidy-9.0!")
    endif()
else()
    find_program(CLANG_TIDY_BIN NAMES "clang-tidy-7")
endif()

if(NOT CLANG_TIDY_BIN)
    message(FATAL_ERROR "clang-tidy not found.")
else()
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE BOOL "" FORCE)
    set(DO_CLANG_TIDY "${CLANG_TIDY_BIN}")
endif()

message(STATUS "Clang-Tidy: '${DO_CLANG_TIDY}'")

# Create project
project(clang-tidy-demo
    VERSION 1.0.0
    DESCRIPTION "Clang tidy demo example"
    LANGUAGES CXX)

add_executable(${PROJECT_NAME})

target_sources(${PROJECT_NAME}
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cc
)

set_target_properties(${PROJECT_NAME}
    PROPERTIES
        CXX_CLANG_TIDY "${DO_CLANG_TIDY}"
)