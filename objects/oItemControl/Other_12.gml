//force discard item to a tile
var vpath;
actionmode = 3

vuseditem = 1
vx = pitem.x
vy = pitem.y
gx = ptargettile.x
gy = ptargettile.y-3
vpath = sItemMakeThrowPath(vx,vy,gx,gy)
with pitem{
    mypath = vpath
    path_start(vpath,3,path_action_stop,0)
    }
pitem.target = ptargettile
pitem.targettile = ptargettile
pitem.thrown = 1



//instance_create(x,y,oActionControl)
//oActionControl.startunit = startunit
//oActionControl.endunitwhendone = 0
//oActionControl.clickunitwhendone = 1
sDestroyRangeTiles()

with oInventoryButton{
    instance_destroy()
    }
findingtarget = 0
//startunit.turnover = 1
//startunit.moved = 1
startunit.cancancelmove = 0

