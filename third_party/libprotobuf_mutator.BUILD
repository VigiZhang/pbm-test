package(default_visibility = ["//visibility:public"])

cc_library(
    name = "mutator",
    srcs = glob(["src/**/*.cc","src/**/*.h","port/protobuf.h"],exclude=["**/*_test.cc"]),
    hdrs = ["src/libfuzzer/libfuzzer_macro.h"],
    deps = ["@com_google_protobuf//:protobuf"],
    nocopts = "-fsanitize.+",
)

