
echo on

set "CFLAGS= -MD"
set "CXXFLAGS= -MD"

mkdir build
cd build
cmake .. -G"Visual Studio 14 2015 Win64" -DUSE_CUDA=ON -DR_LIB=ON
if errorlevel 1 exit 1
cmake --build . --target install --config Release
if errorlevel 1 exit 1
