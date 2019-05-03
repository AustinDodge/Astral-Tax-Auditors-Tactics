/// @description sUnitMoveClimbDefault()
/*This script is called by all units in their step event when they're being knocked from one tile to another.
*/
var vsteps;
vsteps = round(tilemovespeed/3)
sunit = id
canclick = 0//dont' let the player click anything while moving
y -= 6/vsteps
walkstep += 1
//done changing x and y values
if walkstep >= vsteps{//if the unit has completely moved to the next tile
    vertdist -= 1
    walkstep = 0
    if vertdist <= 0{
        climbing = 0
        walkstep = 0
        if waswalking = 1{
            if lasttile.depth < mytile.depth{//set the new depth to the tile with
                depth = lasttile.depth-5//the lowest depth
                }else{//so the unit draws in front
                depth = mytile.depth-5
                }
            walking = 1
            waswalking = 0
            }
        if wasknocked = 1{
            switch knockdir{//find the next tile it will be knocked to
                case 0: 
                    if mytile.my > 0{
                        ntile = ds_grid_get(tilegrid,mytile.mx,mytile.my-1); 
                        }else{
                        ntile = 0
                        }
                    ;break;
                case 1: 
                    if mytile.mx < roomwidth-1{
                        ntile = ds_grid_get(tilegrid,mytile.mx+1,mytile.my); 
                        }else{
                        ntile = 0
                        }
                    ;break;
                case 2: 
                    if mytile.my < roomheight-1{
                        ntile = ds_grid_get(tilegrid,mytile.mx,mytile.my+1); 
                        }else{
                        ntile = 0
                        }
                    ;break;
                case 3: 
                    if mytile.mx > 0{
                        ntile = ds_grid_get(tilegrid,mytile.mx-1,mytile.my); 
                        }else{
                        ntile = 0
                        }
                    ;break;
                }
            if ntile > 0{
                nexttile = ntile
                nexttile.drawshadow = 1
                nexttile.shadowunit = id
                if mytile.depth < ntile.depth{
                    depth = lasttile.depth-5//the lowest depth
                    }else{//so the unit draws in front
                    depth = mytile.depth-5
                    }
                amknocked = 1
                }
            
            mytile.drawshadow = 1
            mytile.shadowunit = id
            }
        }//done with end of tile action
    }
