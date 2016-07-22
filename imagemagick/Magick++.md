```cpp
// clang++ -O2 -o ppm ppm.cpp `Magick++-config --cppflags --cxxflags --ldflags --libs`

#include <Magick++.h> 
#include <iostream>
#include <fstream>
#include <string>

using namespace std; 
using namespace Magick; 
int main(int argc,char **argv) 
{

        InitializeMagick(*argv);

        // read ppm file
        std::ifstream ifs("ao.ppm");
        int begin = static_cast<int>(ifs.tellg());
        ifs.seekg(0, ifs.end);
        int end = static_cast<int>(ifs.tellg());
        int size = end - begin;
        ifs.clear();
        ifs.seekg(0, ifs.beg);
        unsigned char *data = new unsigned char[size];
        ifs.read((char*)data, size);
        Blob blob( data, size ); 
        Image image( blob );
        image.write("ao_cpp.png");
}
```
