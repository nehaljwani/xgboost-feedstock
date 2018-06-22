#!/bin/bash

set -e
set -x

# KLUDGE: manually activate the build environment toolchain to pick up
# the correct compilers flags
unset CFLAGS
unset CXXFLAGS
. ${BUILD_PREFIX}/etc/conda/activate.d/activate-gcc_linux-64.sh
. ${BUILD_PREFIX}/etc/conda/activate.d/activate-gxx_linux-64.sh

mkdir -p build
cd build

LIBRT=$(find ${BUILD_PREFIX} -name "librt.so")
cmake \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DUSE_CUDA=ON \
    -DR_LIB=ON    \
    -DCUDA_rt_LIBRARY=${LIBRT} \
    ..
make -j${CPU_COUNT} ${VERBOSE_CM}
make install -j${CPU_COUNT} ${VERBOSE_CM}
