```py
import os
import bpy

scn = bpy.context.scene
if not scn.render.engine == 'CYCLES':
scn.render.engine = 'CYCLES'

bpy.ops.render.render()
bpy.data.images['Render Result'].save_render(filepath = os.environ['HOME'] + '/cycles_image.png')
```

```bash
 /Applications/blender.app/Contents/MacOS/blender -b -P cyclestest.py 
```

# Link

- http://blenderartists.org/forum/showthread.php?314213-How-do-I-create-CYCles-materials-using-a-python-script&s=c020a386b1d992ceeb9d627b7e058c0d


