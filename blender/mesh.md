```py
import bpy
import math

mesh = bpy.data.meshes.new('CubeMeshByData')
obj = bpy.data.objects.new('CubeObjectByData', mesh)
bpy.context.scene.objects.link(obj)

vertices = [(x, math.sin(x)*y+2*y, 0.0) for x in range(-3, 3) for y in [0,1]]

faces = [
    (0, 1, 3, 2),
    (2, 3, 5, 4),
    (4, 5, 7, 6),
    (6, 7, 9, 8),
    (8, 9, 11, 10),
]
mesh.from_pydata(vertices, [], faces)
mesh.update()
```
