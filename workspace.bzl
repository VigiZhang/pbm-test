# external dependences
  
def external_dependences():
    if "com_google_protobuf" not in native.existing_rules():
        # proto_library, cc_proto_library, and java_proto_library rules implicitly
        # depend on @com_google_protobuf for protoc and proto runtimes.
        # This statement defines the @com_google_protobuf repo.
        native.new_http_archive(
            name = "com_google_protobuf",
            sha256 = "cef7f1b5a7c5fba672bec2a319246e8feba471f04dcebfe362d55930ee7c1c30",
            strip_prefix = "protobuf-3.5.0",
            urls = ["https://github.com/google/protobuf/archive/v3.5.0.zip"],
        )

    if "libprotobuf_mutator" not in native.existing_rules():
        # libprotobuf-mutator
        native.new_http_archive(
            name = "libprotobuf_mutator",
            build_file = "third_party/libprotobuf_mutator.BUILD",
            sha256 = "eb324bd521d922a9b1a0a4cb59ffb5860e6868f1ad2b59d5c34e35df630ce667",
            strip_prefix = "libprotobuf-mutator-1.0",
            url = "https://github.com/VigiZhang/libprotobuf-mutator/archive/v1.0.tar.gz",
        )

    if "clang_compiler_rt" not in native.existing_rules():
        # libfuzzer
        native.new_http_archive(
            name = "clang_compiler_rt",
            build_file = "third_party/compiler_rt.BUILD",
            sha256 = "f3a84da598b1b17153b9afcc8ee6376e5d2cc7da728d2f3fda90d98fc93c4bec",
            strip_prefix = "compiler-rt-42df8011b906358522219a262e6fbd2e47e7a3d6/",
            type = "zip",
            url = "https://github.com/llvm-mirror/compiler-rt/archive/42df8011b906358522219a262e6fbd2e47e7a3d6.zip",
        )
