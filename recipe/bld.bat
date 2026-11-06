cmake %CMAKE_ARGS% -G Ninja -S . -B build -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" -DCMAKE_BUILD_TYPE=Release -DCXXOPTS_BUILD_EXAMPLES=OFF
if errorlevel 1 exit 1

cmake --build build
if errorlevel 1 exit 1

ctest --test-dir build --output-on-failure
if errorlevel 1 exit 1

cmake --install build
if errorlevel 1 exit 1
