image_speed = 0

elevation = 0
drawme = 1

mx = 0
my = 0
occupied = 0

drawshadow = 0
shadowunit = 0

parent = 0//used for djkstra's algorithm
mydistance = 0//used for djkstra
attackdistance = 0//used for djkstra
mycost = 0//used for djkstra - if there is an intrinsic cost to move through the tile
cango = 0//if the tile can currently be moved to
canattack = 0//if the tile is in the units attackrange
attackable = 0//if the tile contains an enemy that can be attacked
canitem = 0//if an item can be thrown to this tile

active = 0

bordersprite = metaltileborder

n = -1
e = -1
s = -1
w = -1

bordern = 0
bordere = 0
borders = 0
borderw = 0
safetyn = 0
safetye = 0
safetyw = 0
safetys = 0
safetyborder = 0

shadown = 0
shadowe = 0

door = 0

atile = 0

onxaxis = 0
onyaxis = 0

onmovepath = 0//if the tile is on the movement path
movepathindex = 0//which image of the movepath sprite to draw

elevatordirection = 0//if the tile will be turned into an elevator, this determines which tile it will lead to.
myobject = 0//if there is a stationary object on the tile, this is its ID
mydressing = 0//what set dressing sprite the tile should draw on itself, if any.

scarred = 0
scarno = irandom(2)


