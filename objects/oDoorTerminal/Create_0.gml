image_speed = 0

elevation = 0
drawme = 1

mx = 0
my = 0
occupied = 0

parent = 0//used for djkstra's algorithm
mydistance = 0//used for djkstra
mycost = 0//used for djkstra - if there is an intrinsic cost to move through the tile
attackdistance = 0//used for djkstra
cango = 0//if the tile can currently be moved to
canattack = 0//if the tile is in the units attackrange
attackable = 0//if the tile contains an enemy that can be attacked
canitem = 0//if an item can be thrown to this tile

bordersprite = metaltileborder

active = 0

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

elevatordirection = 0//if the tile will be turned into an elevator, this determines which tile it will lead to.
obstacleheight = 2//how much the obstacle will add to the elevation of the tile, used for finding LOS
myheight = obstacleheight
locked = 1
team = -1


var vlight;
vlight = instance_create(x,y,oLightSource)
vlight.radius = 30
vlight.pureradius = 15
vlight.parent = id
with vlight{
    event_perform(ev_other,ev_user0)
    }


