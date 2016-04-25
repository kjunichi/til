import os
import bpy

scn = bpy.context.scene
if not scn.render.engine == 'CYCLES':
	scn.render.engine = 'CYCLES'

bpy.ops.render.render()
bpy.data.images['Render Result'].save_render(filepath = os.environ['HOME'] + '/cycles_image.png')
