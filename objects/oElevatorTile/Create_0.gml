image_speed = 0

elevation = 0
drawme = 1

mx = 0
my = 0
occupied = 0

parent = 0//used for djkstra's algorithm
mydistance = 0//used for djkstra
attackdistance = 0//used for djkstra
mycost = 0//used for djkstra - if there is an intrinsic cost to move through the tile
cango = 0//if the tile can currently be moved to
canattack = 0//if the tile is in the units attackrange
attackable = 0//if the tile contains an enemy that can be attacked
canitem = 0//if an item can be thrown to this tile

active = 0

drawshadow = 0
shadowunit = 0

bordersprite = metaltileborder

n = -1
e = -1
s = -1
w = -1

bordern = 0
bordere = 0
borders = 0
borderw = 0

door = 0

atile = 0

onxaxis = 0
onyaxis = 0

onmovepath = 0//if the tile is on the movement path
movepathindex = 0//which image of the movepath sprite to draw

lowelevation = 0
topelevation = 0
downorup = 0
goingup = 0
goingdown = 0
animstage = 0

basex = x//the coordinates of where to draw the base elevatorcolumn sprite
basey = y
animstep = 0
animating = 0//if the elevator is currently going up or down
donemoving = 0

myobject = 0
mydressing = 0//what set dressing sprite the tile should draw on itself, if any.

scarred = 0
scarno = irandom(2)

