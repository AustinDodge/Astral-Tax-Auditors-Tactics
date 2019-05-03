/// @description sUnitMoveFallDefault()
/*This script is called by all units in their step event when they're being knocked from one tile to another.
*/

var vtile,vunit,velevation,bouncefound,i,bouncelist,ntile,changedit,vteam,vsteps;

vsteps = round(tilemovespeed/3)
sunit = id
canclick = 0//dont' let the player click anything while moving
y += 6/vsteps
walkstep += 1

//done changing x and y values
if walkstep >= vsteps{//if the unit has completely moved to the next tile
    walkstep = 0
    vertdist -= 1
    elevation -= 1
    changedit = 0//if the unit changed to moving,walking or bouncing
    
    if vertdist <= 1{
        vtile = mytile
        if mytile.occupied > 0 or ds_grid_get(tiletypegrid,mytile.mx,mytile.my) = 7{//if there's a unit on the tile the unit is falling onto
            var vbounce;
            vbounce = 1
            
            vunit = mytile.occupied
            if vunit > 0{
                if waswalking = 1{//if the unit was walking instead of bouncing
                    if vunit.team = team or vunit.object_index = oKOAuditor{//and the unit it will land on is on its own team
                        
                        vbounce = 0//don't bounce
                        }
                    }
                }
            if vbounce = 1{
                if vunit > 0{
                    elevation = mytile.elevation+vunit.myheight
                    vunit.knockdamage += 5//placeholder squish damage
                    sAddUnitToKnockedList(vunit)
                    vunit.alarm[4] = 20
                    }else{
                    elevation = mytile.elevation//get the actual elevation so it takes into account any obstacles or whatevz
                    }
                bouncing = 1
                falling = 0
                walkstep = 0
                vertdist = 0
                sUnitMoveFindNextBounceTile()
                mx = mytile.mx
                my = mytile.my
                changedit = 1
                }
            }
        }
    
    if vertdist <= 0 and changedit = 0{//stay here if the unit can
        walkstep = 0
        falling = 0
        willfall = 0
        x = mytile.x
        y = mytile.y
        mx = mytile.mx
        my = mytile.my
        elevation = mytile.elevation
        
        if waswalking = 1{
            walking = 1
            walkstep = tilemovespeed*2//reset walkstep so the unit doesn't try to move to the next tile if this is the last tile
            }
        if wasknocked = 1{
            lasttile = mytile
            nexttile = mytile
            if knockforce > 0{
                amknocked = 1
                ntile = 0
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
                    }else{
                    nexttile = mytile
                    }
                nexttile.drawshadow = 1
                nexttile.shadowunit = id
                mytile.drawshadow = 1
                mytile.shadowunit = id
                
                }else{
                mytile.occupied = id
                //canclick = 1
                depth = mytile.depth-5
                ds_grid_set(unitposgrid,mx,my,id)
                wasknocked = 0
                moving = 0
                alarm[4] = 20
                }
            }
        }//done with end of tile action
    }
