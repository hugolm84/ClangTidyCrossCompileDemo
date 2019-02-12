# Use clang-tidy on different platforms/compilers with CMake

This repository expects you to have either

1. clang-tidy-7 installed (linux)
2. clang-tidy from llvm 7.0.1 (windows)
3. cmake >3.12
4. Ninja (windows)
5. A Yocto / Poky toolchain installed


# On Windows
Open `x64|x86 Native Tools Command Prompt for VS 2017` and run

``` 
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON 
-G Ninja 
..
cmake --build .
```

# On Linux
Run
```
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON ..
cmake --build .
```

# Cross Compiling

Run
```
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON 
-DCMAKE_TOOLCHAIN_FILE:FILEPATH:../arm-poky-cortexa9.cmake ..
cmake --build .
```

# Results
Expected clang-tidy to report some warnings and suggestions on all 
platforms.
