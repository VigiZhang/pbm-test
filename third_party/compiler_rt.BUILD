package(default_visibility = ["//visibility:public"])

cc_library(
    name = "libfuzzer",
    srcs = glob([
        "lib/fuzzer/*.cpp",
        "lib/fuzzer/*.h",
    ]),
    hdrs = glob(["lib/fuzzer/*.def"]),
    linkopts = [
        "-lpthread",
        "-lm",
    ],
    nocopts = "-fsanitize.+",
)
