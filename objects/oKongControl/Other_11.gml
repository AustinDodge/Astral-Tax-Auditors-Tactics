
canclick = 1

//reset object stuff
myobject.mytile = objecttile
myobject.mx = objecttile.mx
myobject.my = objecttile.my
myobject.facing = objectface
if myobject.knockaxis > 0{
    with myobject{
        switch facing{
            case 0: knockaxis = 1; break;
            case 1: knockaxis = 2; break;
            case 2: knockaxis = 1; break;
            case 3: knockaxis = 2; break;
            }
        }
    }
objecttile.occupied = myobject
ds_grid_set(unitposgrid,objecttile.mx,objecttile.my,myobject)



myobject.x = objecttile.x
myobject.y = objecttile.y
myobject.depth = objecttile.depth-1

myunit.anim = 0

sClickOnPlayerUnit(myunit)
mouse_clear(mb_left)

