/// @description sIsKnockPossible(unit,directiont)
/// @param unit
/// @param directiont
/*this script determines if a unit can be knocked at all - i.e., if there are units against
a wall or the unit is against a wall directly in the knock direction of a unit.
*/
var vunit,vdir,canknock,vtile,ntile,noknock,vdist,willfall;
vunit = argument0
vdir = argument1
vtile = vunit.mytile


canknock = 0
noknock = 0


if vdir > -1{
    while canknock = 0 and noknock = 0{
        willfall = 0
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
                if !instance_exists(oKongControl){//if a unit is using Kong, it can throw any barrel it can pick up
                    noknock = 1
                    }
                }
                
            if ntile.occupied > 0{//if there's a unit on it
                if !instance_exists(oKongControl){//can't throw barrels into units with Kong
                    vunit = ntile.occupied
                    if vunit.knockable = 1{//and the unit can be knocked
                        vtile = ntile//check if that unit can be knocked from this tile in this direction
                        }
                    }else{
                    noknock = 1//can't throw objects into units with Kong
                    }
                }else{//if there's not a unit on it
                canknock = 1//then a knock can happen, end the script
                }
            }
        }
    }else{
    noknock = 1
    }
    
if noknock = 1{
    canknock = 0
    }
    
if ds_list_find_value(vunit.abilitiesusedlist,35) = 1{//if the unit is using the ability Sure Footing
    canknock = 0
    }

return canknock;














