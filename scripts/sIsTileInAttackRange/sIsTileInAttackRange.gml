/// @description sIsTileInAttackRange(tile,unit)
/// @param tile
/// @param unit
/*this script checks if a given tile can be attacked by a given unit without
that unit moving. Does not check LOS. It returns 1 for true or 0 for false.
*/
var checktile,vunit,vtile,xdiff,ydiff,vdiff,inrange,vuprange;

inrange = 0
checktile = argument0
vunit = argument1
vtile = ds_grid_get(tilegrid,vunit.mx,vunit.my)
xdiff = abs(checktile.mx-vtile.mx)
ydiff = abs(checktile.my-vtile.my)
vdiff = abs(checktile.elevation - vtile.elevation)
vuprange = vunit.attackuprange
if vuprange = -1{
    vuprange = 10000
    }
if (xdiff + ydiff <= vunit.attackrange){//if it's close enough
    if vdiff <= vuprange{//and the vertical difference is low enough
        inrange = 1
        }
    }

return inrange;     
