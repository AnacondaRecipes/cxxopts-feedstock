#!/bin/bash
set -ex

# CMake 4 nested test projects declare a 3.1 policy minimum.
export CMAKE_POLICY_VERSION_MINIMUM=3.5

cmake ${CMAKE_ARGS} -G Ninja -S . -B build \
  -DCMAKE_INSTALL_PREFIX="$PREFIX" \
  -DCMAKE_BUILD_TYPE=Release
cmake --build build
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-0}" != 1 ]]; then
  ctest --test-dir build --output-on-failure
fi
cmake --install build
