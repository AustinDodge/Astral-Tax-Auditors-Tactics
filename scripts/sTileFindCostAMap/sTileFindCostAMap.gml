/// @description sTileFindCostAMap(prevdist,prevtile,currenttile)
/// @param prevdist
/// @param prevtile
/// @param currenttile
/*This script is used by sAFindMapPath to determine the cost of a tile. Right now
it always returns 1.
*/

var prevdist,prevtile,vdiff,velevator,prevheight,currentheight,vcost,vtype,vtile;

prevdist = argument0
prevtile = argument1
vtile = argument2
prevheight = prevtile.elevation
currentheight = elevation
vdiff = abs(currentheight - prevheight)
velevator = 0
if ds_grid_get(tiletypegrid,mx,my) = 5{
    velevator = 1
    }
if ds_grid_get(tiletypegrid,prevtile.mx,prevtile.my) = 5{
    velevator = 1
    }


vcost = prevdist+1//add one for moving one tile
if ds_grid_get(savetilegrid,vtile.mx,vtile.my) = 0{//if the tile isn't already saved,
    vcost += 6//additional cost for a new path.
    }

if vdiff > 0{
    if vdiff < 3{//if there's a height difference between the two tiles that can be navigated on foot
        //vcost += vdiff
        }else{//if it can't typically be traversed
        //if velevator = 0{
        //    vcost = 0
        //    }
        }
    }
if velevator = 1{//assume a full turn to go up an elevator
    vcost = 5
    }
vtype = ds_grid_get(tiletypegrid,mx,my)
switch vtype{
    case 6: vcost = 0; break;//can't pass obstacles
    case 7: vcost = 0; break;//can't pass terminals
    }
        
return vcost;



