# Brachistochrone curve

```py
import bpy
import math

meshName = 'CurveMeshByData'
objName = 'CurveObjectByData'
mesh = bpy.data.meshes.new(meshName)
obj = bpy.data.objects.new(objName, mesh)
bpy.context.scene.objects.link(obj)

xmin = 0
xmax = 3.1
step = 25

vertices=[]
for x in range(0,step):
    for y in [0,1]:
        t = x*((xmax-xmin)/(step-1))+xmin
        vertex = (t - math.sin(t), (1+math.cos(t))*y+1*y, 0.0)
        vertices.append(vertex)

# TODO sort

faces=[]

for i in range(0,step-1):
    idx=i*2
    face = (idx, idx+1, idx+3, idx+2)
    faces.append(face)

mesh.from_pydata(vertices, [], faces)
mesh.update()
bpy.context.scene.objects.active = bpy.data.objects[objName]
bpy.ops.object.editmode_toggle()
bpy.ops.mesh.extrude_region_move(MESH_OT_extrude_region={"mirror":False}, TRANSFORM_OT_translate={"value":(0, 0, -3), "constraint_axis":(False, False, True), "constraint_orientation":'NORMAL', "mirror":False, "proportional":'DISABLED', "proportional_edit_falloff":'SMOOTH', "proportional_size":1, "snap":False, "snap_target":'CLOSEST', "snap_point":(0, 0, 0), "snap_align":False, "snap_normal":(0, 0, 0), "gpencil_strokes":False, "texture_space":False, "remove_on_cancel":False, "release_confirm":False})
bpy.ops.object.editmode_toggle()
bpy.context.object.rotation_euler[0] = 1.5708
bpy.context.scene.objects.active = bpy.data.objects[objName]
bpy.ops.object.origin_set(type='ORIGIN_CENTER_OF_MASS')
```


```py
import bpy
import math

mesh = bpy.data.meshes.new('CurveMeshByData')
obj = bpy.data.objects.new('CurveObjectByData', mesh)
bpy.context.scene.objects.link(obj)

xmin = 0
xmax = 3.1
step = 100
#vertices = [(x*((xmax-xmin)/(step-1))+xmin, math.sin((x*((xmax-xmin)/(step-1))+xmin))*y+2*y, 0.0) for x in range(0,step) for y in [0,1]]

vertices = [( (x*((xmax-xmin)/(step-1))+xmin) - math.sin((x*((xmax-xmin)/(step-1))+xmin)), (1+math.cos((x*((xmax-xmin)/(step-1))+xmin)))*y+1*y, 0.0) for x in range(0,step) for y in [0,1]]

faces=[]

for i in range(0,step-1):
    idx=i*2
    face = (idx, idx+1, idx+3, idx+2)
    faces.append(face)

mesh.from_pydata(vertices, [], faces)
mesh.update()
bpy.context.scene.objects.active = bpy.data.objects['CurveObjectByData']
bpy.ops.object.editmode_toggle()
bpy.ops.mesh.extrude_region_move(MESH_OT_extrude_region={"mirror":False}, TRANSFORM_OT_translate={"value":(0, 0, -3), "constraint_axis":(False, False, True), "constraint_orientation":'NORMAL', "mirror":False, "proportional":'DISABLED', "proportional_edit_falloff":'SMOOTH', "proportional_size":1, "snap":False, "snap_target":'CLOSEST', "snap_point":(0, 0, 0), "snap_align":False, "snap_normal":(0, 0, 0), "gpencil_strokes":False, "texture_space":False, "remove_on_cancel":False, "release_confirm":False})

```

# test

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
