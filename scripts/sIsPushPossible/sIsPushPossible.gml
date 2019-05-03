/// @description sIsPushPossible(unit,directiont)
/// @param unit
/// @param directiont
/*This script determines if a unit can be pushed in any direction - if it can be knocked
at least one tile without bumping into a wall or unit. It's similar to sIsKnockPossible
but doesn't have a loop, as it only needs to consider the first tile, and always returns
negative if there's a unit on it.
*/
var vunit,vdir,canknock,vtile,ntile,noknock,vdist,willfall;
vunit = argument0
vdir = argument1
vtile = vunit.mytile


canknock = 0
noknock = 0


switch vdir{//find the next tile the unit will be knocked to
    case 0: //being knocked north
        if vtile.my > 0{//if north is a viable option
            ntile = ds_grid_get(tilegrid,vtile.mx,vtile.my-1)
            }else{
            noknock = 1//if not, a knock is not possible
            }
        ; break;
    case 1: //being knocked east
        if vtile.mx < roomwidth-1{
            ntile = ds_grid_get(tilegrid,vtile.mx+1,vtile.my)
            }else{
            noknock = 1
            }
        ; break;
    case 2: //being knocked south
        if vtile.my < roomheight-1{
            ntile = ds_grid_get(tilegrid,vtile.mx,vtile.my+1)
            }else{
            noknock = 1
            }
        ; break;
    case 3://being knocked west
        if vtile.mx > 0{
            ntile = ds_grid_get(tilegrid,vtile.mx-1,vtile.my)
            }else{
            noknock = 1
            }
        ; break;
    }
if noknock = 0{//if a knock is possible at all from that position
    if ntile.elevation < vtile.elevation-vunit.downrange{//if the unit will "fall" rather than slide into this tile
        willfall = 1
        canknock = 1//knock is guaranteed
        }
        
    if ntile.elevation > vtile.elevation + 1{//cannot knock over one elevation
        noknock = 1
        }
        
    if ntile.occupied > 0{//if there's a unit on it
        noknock = 1
        }
    }
    
if noknock = 1{
    canknock = 0
    }

return canknock;














