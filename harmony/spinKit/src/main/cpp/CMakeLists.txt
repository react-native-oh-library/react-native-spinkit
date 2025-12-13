cmake_minimum_required(VERSION 3.13)
set(CMAKE_VERBOSE_MAKEFILE on)

set(rnoh_spinkit_generated_dir "${CMAKE_CURRENT_SOURCE_DIR}/generated")
file(GLOB_RECURSE rnoh_spinkit_generated_SRC "${rnoh_spinkit_generated_dir}/**/*.cpp")
file(GLOB rnoh_spinkit_SRC CONFIGURE_DEPENDS *.cpp)
add_library(rnoh_spinkit SHARED ${rnoh_spinkit_SRC} ${rnoh_spinkit_generated_SRC})
target_include_directories(rnoh_spinkit PUBLIC ${CMAKE_CURRENT_SOURCE_DIR} ${rnoh_spinkit_generated_dir})
target_link_libraries(rnoh_spinkit PUBLIC rnoh)