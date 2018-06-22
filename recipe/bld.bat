
mkdir build
cd build
cmake .. -G"Visual Studio 14 2015 Win64" -DUSE_CUDA=ON
cmake --build . --target xgboost --config Release
if errorlevel 1 exit 1
exit 0
