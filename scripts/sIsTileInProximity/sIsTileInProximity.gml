/// @description sIsTileInProximity(tile,unit,distance)
/// @param tile
/// @param unit
/// @param distance
/*this script checks if a given tile is within a certain distance of a unit's current
position. It does not consider height. It returns 1 for true or 0 for false.
*/
var checktile,vunit,vtile,xdiff,ydiff,vdiff,inrange,vuprange,vdist;

inrange = 0
checktile = argument0
vunit = argument1
vdist = argument2
vtile = ds_grid_get(tilegrid,vunit.mx,vunit.my)
xdiff = abs(checktile.mx-vtile.mx)
ydiff = abs(checktile.my-vtile.my)
vdiff = abs(checktile.elevation - vtile.elevation)
//vuprange = vunit.attackuprange
//if vuprange = -1{
//    vuprange = 10000
//    }
if (xdiff + ydiff <= vdist){//if it's close enough
    inrange = 1

    }

return inrange;     
