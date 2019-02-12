set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR armv7-a)

if(NOT POKY_VERSION)
    set(POKY_VERSION 2.4.4)
endif()

set(POKY_SYSROOTS_MSG "Specify POKY_SYSROOT i.e -DPOKY_SYSROOTS:FILEPATH=/opt/poky/2.4.4/sysroots")
set(POKY_SYSROOTS /opt/poky/${POKY_VERSION}/sysroots CACHE STRING ${POKY_SYSROOTS_MSG})

# Setup the gcc/g++ paths
set(TOOLCHAIN_PREFIX ${POKY_SYSROOTS}/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-)
set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}g++)
set(CMAKE_CROSSCOMPILING ON)

# Target sysroot location
set(TARGET_SYSROOT ${POKY_SYSROOTS}/cortexa9hf-neon-poky-linux-gnueabi)
set(CMAKE_FIND_ROOT_PATH ${TARGET_SYSROOT})

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
#search for libraries and header files only in the target environment
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(COMPILER_FLAGS "-march=armv7-a -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 --sysroot=${TARGET_SYSROOT}")
set(CMAKE_C_FLAGS "${COMPILER_FLAGS}" CACHE STRING "CFLAGS" FORCE)
set(CMAKE_CXX_FLAGS "${COMPILER_FLAGS}" CACHE STRING "CXXFLAGS" FORCE)
