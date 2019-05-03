/// @description sTileFindCost(goingorcoming,prevheight,prevdist,vunit,climbheight,uprangemod,parkour)
/// @param goingorcoming
/// @param prevheight
/// @param prevdist
/// @param vunit
/// @param climbheight
/// @param uprangemod
/// @param parkour
/*this script if ran by a tile to find the cost of a tile for the purposes of djkstra 
pathfinding. prevheight is the height of the "current" tile in sFindMoveRange, ie the tile
that the tile running this script is a neighbor of.goingorcoming refers to if the map
will be used to find the move range of a unit, or if it's being used to make a djkstra
map for units to find the best path to that unit. For now, assume it's being used to 
find the moverange of a unit.

prevdist is the "current" tiles cost
*/

var goingorcoming,prevheight,prevdist,vcost,vheight,vunit,vteam,vtype,aimod,vuprange,vclimber,vobstacle,vnogo,
vupmod,vparkour;

goingorcoming = argument0
//goingorcoming = 0
prevheight = argument1
prevdist = argument2
vunit = argument3
vteam = 0
vnogo = 0

vuprange = argument4
vupmod = argument5//the amount by which to decrease the cost the cost of vertical movement

vparkour = argument6



vcost = prevdist+1//add one for moving one tile
vcost += mycost//if tile has an intrinsic cost, add that

if elevation != prevheight{//if this tile isn't at the same elevation as current
    if goingorcoming = 0{//if we're finding a units moverange
        vheight = elevation - prevheight
        vheight -= vupmod
        if vheight < 0{
            vheight = 0
            }
        if vheight > 0{
            if ds_list_find_value(vunit.abilitiesusedlist,41) = 1{//if the unit is using Leap
                vheight = floor(vheight/2)
                }
            if vparkour = 1{
                vheight = ceil(vheight/2)
                }
            if vparkour = 2{
                vheight = floor(vheight/2)
                }
            if vparkour = 3{
                vheight = 0
                }
            vcost += vheight//add the cost of climbing up the tile
            }
        if vheight > vuprange{//if the tile is too high, it's impassable
            vcost = 0
            }
        }else{//if we're making a djkstra map
        if ds_grid_get(tiletypegrid,mx,my) != 5{//if it's not an elevator
            vheight = prevheight - elevation//reverse, for finding path towards
            if vheight > 0{
                vcost += vheight
                }
            if vheight > 2{//assume uprange of 2 for finding dmaps
                vcost += 20//large cost, but not impassable
                }
            }else{
            vcost += 6//add six to cost for elevator tiles
            }
        } 
    }
if goingorcoming = 0{//don't consider other units when making a dmap
    if vunit > 2{//if a unit is calling this
        vteam = vunit.team
        }else{//if not, vunit will be the calling team
        vteam = vunit
        }
    if occupied > 0{//if there's a unit on the tile
        aimod = 0
        if occupied.team != vteam{//and the unit isn't the same team as the checking unit
            if instance_exists(oAIControl){
                if oAIControl.stage = 1{//if the AI is activating units
                    aimod = 1
                    }
                }
            if aimod = 0{//for regular moves
                if occupied.object_index != oCorpseAuditor and occupied.object_index != oKOAuditor{
                    if ds_list_find_value(vunit.abilitiesusedlist,36) = 0{//if the unit isn't using the Nimble ability
                        vcost = 0//the tile is impassable
                        }
                    }
                }
            }
        }
    }else{
    //when making AI dmaps, add extra cost for passing obstacles like barrels and chests - that way, we can easily check if
    //the only path is through the obstacle and it needs to be destroyed.
    if occupied > 0{
        if occupied.team > 2{
            vcost += 8
            }
        }
    }
if object_index = oPitTile{
    vcost = 0//the tile is impassable
    }

vtype = ds_grid_get(tiletypegrid,mx,my)

vobstacle = 0
switch vtype{
    case 6: vobstacle = 1; break;//can't pass obstacles
    case 7: vobstacle = 1; break;//can't pass door terminals
    }
if vobstacle = 1{
    if ds_list_find_value(vunit.abilitieslist,40) = 0{//if the unit doesn't have Hurdler
        vnogo = 1
        }
    } 
        
if vnogo = 1{
    vcost = 0
    }
return vcost;



