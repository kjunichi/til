import bpy
import addon_utils

# enable addon add_curve_sapling
addon_utils.enable('add_curve_sapling')

# get obj name list before tree create
for i in bpy.data.objects:
  print(i)

bpy.ops.curve.tree_add(do_update=True, chooseSet='1', bevel=True, prune=True, showLeaves=True, useArm=False, seed=0, handleType='0', levels=3, length=(1, 0.3, 0.6, 0.45), lengthV=(0, 0, 0, 0), branches=(0, 50, 30, 10), curveRes=(3, 5, 3, 1), curve=(0, -40, -40, 0), curveV=(20, 50, 75, 0), curveBack=(0, 0, 0, 0), baseSplits=0, segSplits=(0, 0, 0, 0), splitAngle=(0, 0, 0, 0), splitAngleV=(0, 0, 0, 0), scale=8, scaleV=3, attractUp=0.5, shape='1', baseSize=0.4, ratio=0.015, taper=(1, 1, 1, 1), ratioPower=1.2, downAngle=(90, 60, 45, 45), downAngleV=(0, -50, 10, 10), rotate=(140, 140, 140, 77), rotateV=(0, 0, 0, 0), scale0=1, scaleV0=0.2, pruneWidth=0.4, pruneWidthPeak=0.6, prunePowerHigh=0.5, prunePowerLow=0.001, pruneRatio=1, leaves=25, leafScale=0.17, leafScaleX=1, leafDist='4', bend=0, bevelRes=0, resU=4, frameRate=1, windSpeed=2, windGust=0, armAnim=False, startCurv=0)

# get name after created tree
for i in bpy.data.objects:
  print(i)
