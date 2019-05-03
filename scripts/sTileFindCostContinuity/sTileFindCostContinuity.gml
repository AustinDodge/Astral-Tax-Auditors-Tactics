/// @description sTileFindCostContinuity(prevdist,prevtile,)
/// @param prevdist
/// @param prevtile
/*This script is part of the dmap continuity script. It determines the cost of the next
tile based on their relative height and the presence of an elevator. It is run by the
tile that is being checked.

*/

var prevdist,prevtile,vdiff,velevator,prevheight,currentheight,vcost,vtype;

prevdist = argument0
prevtile = argument1
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

if vdiff > 0{
    if vdiff < 3{//if there's a height difference between the two tiles that can be navigated on foot
        vcost += vdiff
        }else{//if it can't typically be traversed
        if velevator = 0{
            vcost = 0
            }else{
            vcost += vdiff
            }
        }
    }
if velevator = 1{//assume a full turn to go up an elevator
    vcost = 5
    }
if object_index = oPitTile{
    vcost = 0//can't cross pits ever
    }
vtype = ds_grid_get(tiletypegrid,mx,my)
switch vtype{
    case 6: vcost = 0; break;//can't pass obstacles
    case 7: vcost = 0; break;//can't pass terminals
    }
        
return vcost;
