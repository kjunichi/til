# How to I know addon's status

```py
import sys
import bpy
import addon_utils

myAddons = {}

for mod in addon_utils.modules():
#    print(mod.bl_info.get('name'))
#    print(mod.bl_info)
    myAddons[mod.bl_info.get('name')]='Disable ' + mod.__name__

#for mod_key in bpy.context.user_preferences.addons.keys():
#    mod = sys.modules[mod_key]
#    print(mod.bl_info.get('name'))
#    myAddons[mod.bl_info.get('name')] = 'Enable'

for mod_key in sys.modules:
  for mod in addon_utils.modules():
    if(mod_key == mod.__name__):
      myAddons[mod.bl_info.get('name')] = 'Enable'

for mod_name in myAddons:
  print(mod_name + " : " + myAddons[mod_name])
```

```bash
/Applications/blender.app/Contents/MacOS/blender --addons add_curve_sapling -b -P list.py 
```


# How can I get a list of the installed addons using the API

```py
import addon_utils
for mod in addon_utils.modules():
    print(mod.bl_info)

```
# Link

- [python - How can I get a list of the installed addons using the API? - Blender Stack Exchange](http://blender.stackexchange.com/questions/2797/how-can-i-get-a-list-of-the-installed-addons-using-the-api)
