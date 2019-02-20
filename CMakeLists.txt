cmake_minimum_required(VERSION 3.5)

project(pbm-test)

set(PBM_TEST_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(PBM_TEST_BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR})

# use clang++-6.0 so need to compile libFuzzer.a independently
set(CMAKE_CXX_COMPILER clang++-6.0)
set(CMAKE_CXX_FLAGS "-g -Wall -Werror -std=c++11 -pthread")
set(FUZZING_FLAGS "-fsanitize=address -fsanitize=fuzzer-no-link")
set(FUZZING_FLAGS_BINARY "-fsanitize=address")

# set libFuzzer.a to this folder
set(LIBFUZZER ${PBM_TEST_SOURCE_DIR}/libFuzzer.a)

# install libprotobuf-mutator first
include_directories("/usr/local/include/libprotobuf-mutator")

set(PBM_LIB_PATH /usr/local/lib/libprotobuf-mutator.a)
set(PBM_FUZZ_LIB_PATH /usr/local/lib/libprotobuf-mutator-libfuzzer.a)
set(LIB_PROTOBUF_MUTATOR_LIBRARIES ${PBM_FUZZ_LIB_PATH} ${PBM_LIB_PATH})

# compile protobuf
include(FindProtobuf)
find_package(Protobuf REQUIRED)
include_directories(${PROTOBUF_INCLUDE_DIR})

protobuf_generate_cpp(PBM_TEST_PROTO_SRCS
		      PBM_TEST_PROTO_HDRS
		      pbm_test.proto)
add_library(pbm-test-proto
	    ${PBM_TEST_PROTO_SRCS})

include_directories(${CMAKE_CURRENT_BINARY_DIR})
		      
add_executable(pbm-test-fuzz pbm_test_fuzz.cc)
target_link_libraries(pbm-test-fuzz
		      pbm-test-proto
		      ${PROTOBUF_LIBRARIES}
		      ${LIB_PROTOBUF_MUTATOR_LIBRARIES}
		      ${LIBFUZZER})
		      
set_property(TARGET pbm-test-fuzz
	     PROPERTY COMPILE_FLAGS ${FUZZING_FLAGS})

set_property(TARGET pbm-test-fuzz
	     PROPERTY LINK_FLAGS ${FUZZING_FLAGS_BINARY})

