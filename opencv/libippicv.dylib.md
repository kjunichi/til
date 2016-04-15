# How to make libippicv.dylib

```bash
cd /usr/local/opt/opencv3/share/OpenCV/3rdparty
g++ -dynamiclib -o libippicv.dylib libippicv.a 
mv libippicv.dylib /usr/local/opt/opencv3/lib
cd /usr/local/opt/opencv3/lib
install_name_tool -id /usr/local/opt/opencv3/lib/libippicv.dlyb libippicv.dylib 
```
