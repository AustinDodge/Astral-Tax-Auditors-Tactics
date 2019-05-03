/// @description sTileElevatorCheck(vtile)
/// @param vtile
/*this script is run to see if a particular tile is a good candidate to place an elevator
on. This is the criteria: not a door, adjacent to the current tile, perpendicular to the 
unenterable tile, the same height as current tile and are also adjacent to an unenterable 
tile.
*/
var vdir,vtile,j,ctile,vtop;
vtile = argument0
j = 1
with vtile{
    vdir = 0//the direction to check for adjacent tiles in. 0 is e-w, 1 is n-s
    if irandom(1) = 0{//randomly switch the start and switch to keep things even.
        vdir = 0
        if s > 0{
            if s.cango = 0{
                vdir = 1
                }
            }
        if n > 0{
            if n.cango = 0{
                vdir = 1
                }
            }
        }else{
        vdir = 1
        if e > 0{
            if e.cango = 0{
                vdir = 0
                }
            }
        if w > 0{
            if w.cango = 0{
                vdir = 0
                }
            }
        }
    if vdir = 0{//if checking e/w
        if e > 0{
            ctile = e
            if ctile.elevation = elevation{
                if ds_grid_get(tiletypegrid,ctile.mx,ctile.my) = 0{
                    if sCheckTileElevatorNeighbor(ctile,ctile.elevation + 1) = 1{
                        j += 1
                        }
                    }
                }
            }
        if w > 0{
            ctile = w
            if ctile.elevation = elevation{
                if ds_grid_get(tiletypegrid,ctile.mx,ctile.my) = 0{
                    if sCheckTileElevatorNeighbor(ctile,ctile.elevation+1) = 1{
                        j += 1
                        }
                    }
                }
            }
        }else{//if checking n/s
        if n > 0{
            ctile = n
            if ctile.elevation = elevation{
                if ds_grid_get(tiletypegrid,ctile.mx,ctile.my) = 0{
                    if sCheckTileElevatorNeighbor(ctile,ctile.elevation+1) = 1{
                        j += 1
                        }
                    }
                }
            }
        if s > 0{
            ctile = s
            if ctile.elevation = elevation{
                if ds_grid_get(tiletypegrid,ctile.mx,ctile.my) = 0{
                    if sCheckTileElevatorNeighbor(ctile,ctile.elevation+1) = 1{
                        j += 1
                        }
                    }
                }
            }
        }
    }
return j;
