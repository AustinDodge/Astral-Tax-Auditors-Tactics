//get previous information for resetting
objecttile = myobject.mytile
objectface = myobject.facing


objecttile.occupied = 0
ds_grid_set(unitposgrid,objecttile.mx,objecttile.my,-1)

myobject.x = myunit.x
myobject.y = myunit.y-((myunit.myheight+1)*elevheight)
myobject.my = myunit.my
myobject.mx = myunit.mx
myobject.depth = myunit.depth-1

myunit.anim = 6
myobject.facing = myunit.facing

myobject.mytile = myunit.mytile
unittile = myunit.mytile

initialized = 1



