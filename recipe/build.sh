#!/bin/bash
set -exo pipefail

# CMake 4 nested test projects declare a 3.1 policy minimum.
export CMAKE_POLICY_VERSION_MINIMUM=3.5

cmake ${CMAKE_ARGS} -G Ninja -S . -B build \
  -DCMAKE_INSTALL_PREFIX="$PREFIX" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCXXOPTS_BUILD_EXAMPLES=OFF
cmake --build build
  ctest --test-dir build --output-on-failure
cmake --install build
