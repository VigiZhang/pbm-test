#include <cmath>
#include <cstdlib>

#include "pbm_test.pb.h"
#include "src/libfuzzer/libfuzzer_macro.h"

protobuf_mutator::protobuf::LogSilencer log_silincer;

DEFINE_PROTO_FUZZER(const pbm_test::Msg& message) {
  // Emulate a bug.
  /*if (message.o_string() == "FooBar" &&
      message.o_uint64() > 100 &&
      !std::isnan(message.o_float()) &&
      std::fabs(message.o_float()) > 1000 &&
      std::fabs(message.o_float()) < 1E10) {
    abort();
  }*/
  if (message.o_string() == "FooB") {
    int a[3] = {'a', 'b', 'c'};
    for (int i = 0; i < 4; ++i)
      a[0] = a[i];
  }
  /*if (message.o_string() == "FooB") {
    char *x = (char*)malloc(10 * sizeof(char*));
    free(x);
    return x[5];
  }*/
}
