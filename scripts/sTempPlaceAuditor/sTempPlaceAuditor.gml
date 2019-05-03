/// @description sTempPlaceAuditor
/*temp script just to get an auditor on the map
*/

var madeone,vx,vy,vtile,vunit;

madeone = 0
vx = 0
vy = 0

while madeone < 2{
    vtile = ds_grid_get(tilegrid,vx,vy)
    if vtile.door = 1{
        madeone += 1
        vunit = instance_create(x,y,oAuditor)
        vunit.x = vtile.x
        vunit.y = vtile.y
        vunit.depth = vtile.depth-5
        vunit.mx = vx
        vunit.my = vy
        vunit.mytile = vtile
        }
    vx += 1
    if vx = roomwidth-1{
        vx = 0
        vy += 1
        }
    }
    
with oUnitParent{
    event_perform(ev_other,ev_user0)
    }
