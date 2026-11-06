#!/bin/bash
set -exo pipefail

cmake ${CMAKE_ARGS} -G Ninja -S . -B build \
  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
  -DCMAKE_INSTALL_PREFIX="$PREFIX" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCXXOPTS_BUILD_EXAMPLES=OFF
cmake --build buildctest --test-dir build --output-on-failure
cmake --install build
