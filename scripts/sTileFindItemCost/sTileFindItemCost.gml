/// @description sTileFindItemCost(goingorcoming,prevheight,prevdist,vunit)
/// @param goingorcoming
/// @param prevheight
/// @param prevdist
/// @param vunit
/*this script if ran by a tile to find the cost of a tile for the purposes of djkstra 
pathfinding. prevheight is the height of the "current" tile in sFindMoveRange, ie the tile
that the tile running this script is a neighbor of.goingorcoming refers to if the map
will be used to find the move range of a unit, or if it's being used to make a djkstra
map for units to find the best path to that unit. For now, assume it's being used to 
find the moverange of a unit.

Currently, this doesn't add any additional costs to a tile for any reason. In the future,
a unit may be able to throw an item farther to tiles that are at a lower elevation.

prevdist is the "current" tiles cost
*/

var goingorcoming,prevheight,prevdist,vcost,vheight,vunit,vteam,vtype;

goingorcoming = argument0
//goingorcoming = 0
prevheight = argument1
prevdist = argument2
vunit = argument3
vteam = 0


vcost = prevdist+1//add one for moving one tile
vcost += mycost//if tile has an intrinsic cost, add that

vtype = ds_grid_get(tiletypegrid,mx,my)
switch vtype{
    case 6: vcost = 0; break;//can't pass obstacles
    }


return vcost;



