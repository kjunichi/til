# OpenCV on Blender

```bash
brew install python3
brew install opencv3 --with-python3 --with-tbb --with-ffmpeg
```

```py
import cv2

print(cv2.__version__)
```

```bash
PYTHONPATH=/usr/local/opt/opencv3/lib/python3.5/site-packages /Applications/blender.app/Contents/MacOS/blender -b -P test.py 
```

# When version mismatch

```
import cv2
RuntimeError: module compiled against API version a but this version of numpy is 9
Traceback (most recent call last):
  File "<blender_console>", line 1, in <module>
ImportError: numpy.core.multiarray failed to import
```
