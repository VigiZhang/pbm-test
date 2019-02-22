package(default_visibility = ["//visibility:public"])

cc_proto_library(
    name = "pbm_test_proto",
    deps = [
        ":pbm_test_proto_lib",
    ],
)

proto_library(
    name = "pbm_test_proto_lib",
    srcs = [
        "pbm_test.proto",
    ],
)

cc_binary(
    name = "pbm_test_fuzz",
    srcs = [
        "pbm_test_fuzz.cc",
	"libFuzzer.a",
    ],
#    copts = [
#	"-g",
#	"-fsanitize=address",
#	"-fsanitize-coverage=trace-pc-guard",
#    ],
#    linkopts = [
#	"-fsanitize=address",
#	"-fsanitize-coverage=trace-pc-guard",
#    ],
    deps = [
	":pbm_test_proto",
	"@libprotobuf_mutator//:mutator",
    ],
)

cc_binary(
    name = "uaf_test",
    srcs = [
        "use_after_free.cc",
    ],
#    copts = [
#        "-fsanitize=address,undefined",
#    ],
#    linkopts = [
#	"-fsanitize=address,undefined",
#	"-lubsan",
#    ],
)

cc_library(
    name = "libfuzzer",
    srcs = [
        "libFuzzer.a",
    ],
    alwayslink = 1,
)

cc_binary(
    name = "easy_fuzz",
    srcs = [
        "easy_fuzz.cc",
    ],
    deps = [
	"@clang_compiler_rt//:libfuzzer",
    ],
#    deps = [
#        ":libfuzzer",
#    ],
)

