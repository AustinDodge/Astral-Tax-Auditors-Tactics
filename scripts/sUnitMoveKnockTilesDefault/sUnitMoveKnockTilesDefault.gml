/// @description sUnitMoveTiles()
/*This script is called by all units in their step event when they're being knocked from one tile to another.
*/
var ntile,noknock,willgo,vunit,willbounce,willknock,willstop,bouncedirlist,vcliffhanger,vforce;
sunit = id
canclick = 0//dont' let the player click anything while moving
switch knockdir{//move the units x/y position based on the unit's facing value
    case -1://no knock direction
        walkstep += 2
        ; break;
    case 0://knocked n
        x -= sAnimWalk(walkstep)
        walkstep += 1
        y -= sAnimWalk(walkstep)
        walkstep += 1
        ; break;
    case 1://knocked e
        x += sAnimWalk(walkstep)
        walkstep += 1
        y -= sAnimWalk(walkstep)
        walkstep += 1
        ; break;
    case 2://knocked s
        x += sAnimWalk(walkstep)
        walkstep += 1
        y += sAnimWalk(walkstep)
        walkstep += 1
        ; break;
    case 3://knocked w
        x -= sAnimWalk(walkstep)
        walkstep += 1
        y += sAnimWalk(walkstep)
        walkstep += 1
        ; break;
    }//done changing x and y values
    
if walkstep = tilemovespeed{//if the unit if halfway through the knock animation
//at this point, the unit is attempting to move into the next tile. Here it checks if there is a reason it shouldn't
//be knocked into the next tile, and if so, what to do. Usually it will at least reverse the knock direction, so it
//will finish the knock animation on the current tile. If so, changing the units actual position happens at this point,
//instead of the end as with walking.
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
    willgo = 0
    willknock = 0
    willfall = 0
    willstop = 0
    if ntile > 0{//if there is a possible next move
        //if ntile.elevation <= mytile.elevation+1{//if the tile is too high, no knock is possible
        var vheight1,vheight2;
        //set up the elevations for the obstacles
        vheight1 = 0
        vheight2 = 0
        if mytile.myobject > 0{
            vheight1 = (mytile.myobject).obstacleheight
            }
        if ntile.myobject > 0{
            vheight2 = (ntile.myobject).obstacleheight
            }
        vforce = 0//if we will "force" the unit to be knocked to the next tile
        //force the knock regardless of height if the unit is using cliffhanger
        if ds_list_find_value(abilitiescooldownlist,8) = 1{
            vforce = 1
            ds_list_replace(abilitiescooldownlist,8,0)
            }
        
        if ((ds_grid_get(mapheightgrid,ntile.mx,ntile.my)+vheight2) - (ds_grid_get(mapheightgrid,mytile.mx,mytile.my)+vheight1) <= 1) or vforce = 1{//if the tile is too high, no knock is possible
            if ntile.occupied = 0{//if there's noone in the next tile
                willgo = 1//the unit will go to that tile. Don't do anything for now
                if ds_grid_get(mapheightgrid,ntile.mx,ntile.my) < ds_grid_get(mapheightgrid,mytile.mx,mytile.my){//if the tile is lower than the current tile
                    willfall = 1//the unit will fall
                    }
                if knockforce = 1{//if there is only one knock left, make sure the tile can be stopped on
                    switch ds_grid_get(tiletypegrid,ntile.mx,ntile.my){
                        case 6: knockforce += 1; break;//can't stop on obstacle
                        case 7: knockforce += 1; break;//can't stop on terminal
                        }
                    }
                }else{//if there's a unit in the next tile
                vunit = ntile.occupied
                if ds_grid_get(mapheightgrid,ntile.mx,ntile.my)+vunit.myheight > ds_grid_get(mapheightgrid,mytile.mx,mytile.my){//if the units head would stick out above the current tile,
                    willknock = 1//knock into the unit
                    }else{//if this unit will fall onto vunit
                    willfall = 1//we will check what happens when this unit falls on that unis in the fall script
                    }//end checking if there's a unit
                }//end occupied check
            
            }else{//if ntile's elevation is too high to enter in a knock
            sUnitKnockReverseDirection()
            knockforce = 0
            willstop = 1
            }
        if ds_grid_get(tiletypegrid,ntile.mx,ntile.my) = -1{//if the tile is a pit
            willfallpit = 1
            willfall = 0
            willgo = 0
            willknock = 0
            }
        }else{//if the next tile is outside the room and therefore invalid
        sUnitKnockReverseDirection()
        knockforce = 0
        }
    
    
    if willknock = 1{//if the unit will knock another unit
        willgo = 0
        vunit = ntile.occupied
        if ds_list_find_value(vunit.abilitiesusedlist,35) = 0{//if the unit isn't using Sure Footing ability
            sUnitKnockIntoUnit(id,vunit,-1)
            }
        /*if rollingknock = 1{
            knockforce = 0
            }
        if vunit.knockable = 1{
            vunit.amknocked = 1//transfer the current knock force to that unit
            vunit.knockforce += knockforce
            vunit.knockdir = knockdir
            vunit.facing = sUnitFaceUnit(vunit,id)
            vunit.knockstep = 0
            vunit.moving = 1
            sAddUnitToKnockedList(vunit)
            }
        knockforce = 0*/
        }
    if willgo = 1 and willfall = 0{//if there's a clear shot to the next tile,
        if mytile.occupied = id{
            mytile.occupied = 0
            ds_grid_set(unitposgrid,mytile.mx,mytile.my,-1)
            }
        lasttile = mytile
        mytile = ntile
        mytile.occupied = id
        ds_grid_set(unitposgrid,mytile.mx,mytile.my,id)
        mx = mytile.mx
        my = mytile.my
        //elevation = mytile.elevation
        elevation = ds_grid_get(mapheightgrid,mytile.mx,mytile.my)
        }
    if willfall = 1{//if the unit will fall,
        if mytile.occupied = id{
            mytile.occupied = 0//it will technically have no tile until the fall is complete
            ds_grid_set(unitposgrid,mytile.mx,mytile.my,-1)
            }
        lasttile = mytile
        mytile = ntile
        mx = mytile.mx
        my = mytile.my
        //vertdist = lasttile.elevation - mytile.elevation
        vertdist = ds_grid_get(mapheightgrid,lasttile.mx,lasttile.my) - ds_grid_get(mapheightgrid,mytile.mx,mytile.my)
        if vertdist > downrange{//if the unit will fall far enough to take damage
            //knockdamage += (vertdist - downrange) * 3//3 is a placeholder value
            knockdamage += sFindKnockFallDamage(vertdist,downrange)
            sAddUnitToKnockedList(id)
            }
        }
    if willfallpit = 1{//if the unit will fall into a pit,
        willfall = 0
        if mytile.occupied = id{
            mytile.occupied = 0//it will technically have no tile until the fall is complete
            ds_grid_set(unitposgrid,mytile.mx,mytile.my,-1)
            }
        lasttile = mytile
        mytile = ntile
        mx = mytile.mx
        my = mytile.my
        vertdist = lasttile.elevation
        //elevation = lasttile.elevation
        elevation = ds_grid_get(mapheightgrid,lasttile.mx,lasttile.my)
        sAddUnitToKnockedList(id)
        //if vertdist > downrange{//if the unit will fall far enough to take damage
            //knockdamage += (vertdist - downrange) * 3//3 is a placeholder value
            //
            //}
        }

    
    }//end mid-move nexttile check

    
if walkstep >= tilemovespeed*2{//if the unit has completely moved to the next tile
    
    knockforce -= 1
    sAbilityReboundCheck(id)
    if instance_exists(oTrickShotControl){
        sTrickShotMakeAttack(id)
        }
    vcliffhanger = 0
    if mytile.object_index = oPitTile{
        vcliffhanger = sAbilityCliffHanger()
        }
    
        
    if willfall = 0 and willfallpit = 0{
        if vcliffhanger = 0{
            x = mytile.x
            y = mytile.y//ensure the unit is at the proper x/y position
            }
        if knockforce <= 0{//if it won't be knocked any further
            
            bx = x
            by = y
            mx = mytile.mx
            my = mytile.my
            depth = mytile.depth-5
            mytile.occupied = id
            //elevation = mytile.elevation
            if vcliffhanger = 0{
                elevation = ds_grid_get(mapheightgrid,mytile.mx,mytile.my)
                }
            ds_grid_set(unitposgrid,mx,my,id)
            moving = 0
            amknocked = 0
            wasknocked = 0
            knockforce = 0
            falling = 0
            climbing = 0
            //canclick = 1
            alarm[4] = 20
            }else{//if the unit can still be knocked
            walkstep = 0
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
            if ntile > 0{//if the units next knock will complete, check if the unit needs to climb
                //if ntile.elevation > mytile.elevation{
                if ds_grid_get(mapheightgrid,ntile.mx,ntile.my) > ds_grid_get(mapheightgrid,mytile.mx,mytile.my){
                    //if ntile.elevation = mytile.elevation + 1{//if the unit needs to climb one tile
                    if ds_grid_get(mapheightgrid,ntile.mx,ntile.my) = ds_grid_get(mapheightgrid,mytile.mx,mytile.my){
                        amknocked = 0
                        wasknocked = 1
                        climbing = 1
                        vertdist = 1
                        }
                    }else{//if the unit isn't climbing
                    if mytile.depth < ntile.depth{//set the new depth to the tile with
                        depth = mytile.depth-5//the lowest depth
                        }else{//so the unit draws in front
                        depth = ntile.depth-5
                        }
                    }
                nexttile = ntile
                }//end checking if unit needs to climb to next tile
            }//end finishing knock
        }else{//if the unit will fall
        if willfall = 1{//if it will fall down a cliff
            amknocked = 0
            wasknocked = 1
            falling = 1
            mx = mytile.mx
            my = mytile.my
            if lasttile.depth < mytile.depth{//set the new depth to the tile with
                depth = lasttile.depth-5//the lowest depth
                }else{//so the unit draws in front
                depth = mytile.depth-5
                }
            }
        if willfallpit = 1{//if it will fall into a pit
            amknocked = 0
            wasknocked = 1
            fallingpit = 1
            falling = 0
            mx = mytile.mx
            my = mytile.my
            fallfadelimit = mytile.elevation
            depth = mytile.depth-5            
            sSoundPlayEffect(soundFallPit1,0.5,0,0)
            
            //if lasttile.depth < mytile.depth{//set the new depth to the tile with
            //    depth = lasttile.depth-5//the lowest depth
            //    }else{//so the unit draws in front
            //    depth = mytile.depth-5
            //    }
            }
            
        }//end finishing with fall
    }//done with move to next tile
