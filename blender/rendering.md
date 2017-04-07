```py
import bpy

bpy.data.scenes["Scene"].render.filepath = '/tmp/kjunichi.jpg'
bpy.data.scenes["Scene"].render.image_settings.file_format='JPEG'
bpy.ops.render.render( write_still=True )

bpy.data.scenes["Scene"].render.filepath = '/tmp/kjunichi.bmp'
bpy.data.scenes["Scene"].render.image_settings.file_format='BMP'
bpy.ops.render.render( animation=False,write_still=True )
```
