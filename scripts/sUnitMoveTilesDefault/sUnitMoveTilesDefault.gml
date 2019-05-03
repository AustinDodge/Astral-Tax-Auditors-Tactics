/// @description sUnitMoveTiles()
/*This script is called by all units in their step event when they're moving from one tile to another.
*/

sunit = id
canclick = 0//dont' let the player click anything while moving
switch facing{//move the units x/y position based on the unit's facing value
    case 0://facing n
        x -= sAnimWalk(walkstep)
        walkstep += 1
        y -= sAnimWalk(walkstep)
        walkstep += 1
        ; break;
    case 1://facing e
        x += sAnimWalk(walkstep)
        walkstep += 1
        y -= sAnimWalk(walkstep)
        walkstep += 1
        ; break;
    case 2://facing s
        x += sAnimWalk(walkstep)
        walkstep += 1
        y += sAnimWalk(walkstep)
        walkstep += 1
        ; break;
    case 3://facing w
        x -= sAnimWalk(walkstep)
        walkstep += 1
        y += sAnimWalk(walkstep)
        walkstep += 1
        ; break;
    }//done changing x and y values
    

    

if walkstep >= tilemovespeed*2{//if the unit has completely moved to the next tile
    if willfall = 0{//if the unit is not about to fall
        if !ds_stack_empty(movestack){//if the unit has more tiles to move through
            if unitmovesound != -1{
                //audio_play_sound(unitmovesound,2,0)
                sSoundPlayEffect(unitmovesound,1,0,1)
                }
            nexttile = ds_stack_pop(movestack)//get the next tile
            //if nexttile.elevation < mytile.elevation{
            if ds_grid_get(mapheightgrid,nexttile.mx,nexttile.my) < ds_grid_get(mapheightgrid,mytile.mx,mytile.my){
                willfall = 1
                vertdist = mytile.elevation - nexttile.elevation
                }
            //if nexttile.elevation > mytile.elevation{
            if ds_grid_get(mapheightgrid,nexttile.mx,nexttile.my) > ds_grid_get(mapheightgrid,mytile.mx,mytile.my){
                climbing = 1
                walking = 0
                waswalking = 1
                vertdist = nexttile.elevation - mytile.elevation
                walkstep = 0
                //check if climbing to a higher elevation than the unit could usually get to. If so,
                //the unit is probably getting climbing help from another unit. Add that unit to 
                //climbedonlist.
                var vuprange,punit;
                vuprange = uprange
                if ds_list_find_value(abilitieslist,1) = 1{
                    vuprange += 1
                    }
                if ds_list_find_value(abilitieslist,2) = 1{
                    vuprange += 2
                    }
                if ds_list_find_value(abilitieslist,3) = 1{
                    vuprange += 3
                    }
                //we now have proper uprange, check if the next tile is higher than the usual uprange
                if vertdist > vuprange{
                    punit = mytile.occupied
                    if punit > 0{//if there's a unit on the current, lower tile
                        if ds_list_find_value(punit.abilitieslist,33) = 1{//if punit has booster
                            if punit.moved = 1{//if the unit has moved this turn
                                ds_list_add(climbedonlist,punit)
                                }
                            }
                        }
                    punit = nexttile.occupied
                    if punit > 0{//if there's a unit on the next, higher tile
                        if ds_list_find_value(punit.abilitieslist,34) = 1{//if punit has lifter
                            if punit.moved = 1{
                                ds_list_add(climbedonlist,punit)
                                }
                            }
                        }
                    }
                }
           // if nexttile.elevation <= mytile.elevation{//if the unit won't be climbing to the next tile
           if ds_grid_get(mapheightgrid,nexttile.mx,nexttile.my) <= ds_grid_get(mapheightgrid,mytile.mx,mytile.my){
                if mytile.depth < nexttile.depth{//set the new depth to the tile with
                    depth = mytile.depth-5//the lowest depth
                    }else{//so the unit draws in front
                    depth = nexttile.depth-5
                    }
                }else{//if the unit is climbing
                lasttile = mytile
                }
            if willfall = 0{
                x = mytile.x
                y = mytile.y//ensure the unit is at the proper x/y position
                }

            if nexttile = mytile.n{//set the proper facing
                facing = 0
                }
            if nexttile = mytile.e{
                facing = 1
                }
            if nexttile = mytile.s{
                facing = 2
                }
            if nexttile = mytile.w{
                facing = 3
                }
            lasttile = mytile
            mytile = nexttile
            walkstep = 0
            //done starting the move to the next tile
            
            }else{//if there are no more tiles to move through
            
            if audio_is_playing(unitmovesound){
                //audio_stop_sound(unitmovesound)
                }
            x = mytile.x
            y = mytile.y
            bx = x
            by = y
            mx = mytile.mx
            my = mytile.my
            depth = mytile.depth-5
            mytile.occupied = id
            //elevation = mytile.elevation
            elevation = ds_grid_get(mapheightgrid,mytile.mx,mytile.my)
            ds_grid_set(unitposgrid,mx,my,id)
            ds_stack_destroy(movestack)
            walking = 0
            waswalking = 0
            moving = 0
            movestep = 0
            //moved = 1
            sDestroyRangeTiles()
            //sFindAttackRange(id,mytile)
            //sMakeAttackRange()
            clickmode = 1
            if ds_list_find_value(abilitiesusedlist,30) = 0{//if the unit isn't moving via Wait for Me
                with oMapTile{
                    parent = 0
                    mydistance = 0
                    cango = 0//reset the tiles
                    canattack = 0
                    attackable = 0
                    }
                if movepoints <= 0 and !instance_exists(oAIControl){//if the unit hasn't used all its movement
                    if attacked = 0{//if this unit has also attacked, it can take no more actions
                        sFindAttackRange(id,mytile)
                        sMakeAttackRange(weaponhealing)
                        }
                    sMakeButtons(id)
                    sMakeInventoryButtons(id)
                    if team = 1{//if the unit is on the human team, allow clicking again
                        canclick = 1
                        //clickmode = 1
                        }
                    }else{//if the unit can still mvoe
                    sClickOnPlayerUnit(id)
                    }
                }
            if instance_exists(oAIControl){
                var didntattack;
                didntattack = 0
                with oAttackRange{
                    if active = 0{
                        instance_destroy()
                        }
                    }
                if !instance_exists(oAttackRange) or oAIControl.currentunitcanattack = 0{//if there's no place to attack, or there is a place to attack but the AI doesn't want the unit to attack
                    oAIControl.movingaunit = 2
                    didntattack = 1
                    }else{//if there is a valid attack
                    if oAIControl.currentunitcanattack = 1{//make sure the AI wanted the unit to attack
                        sClickOnAttackable(id,(oAIControl.bestattacktile).occupied)
                        with oAttackWindow{
                            event_perform(ev_other,ev_user3)
                            }
                        }else{
                        oAIControl.movingaunit = 2
                        didntattack = 1
                        show_message("There was an attack but oAIcontrol didn't take it!")
                        }
                    }
                if didntattack = 1{//if the unit didn't attack, debug
                    var checkunit;
                    checkunit = 0
                    if my > 0{
                        checkunit = ds_grid_get(unitposgrid,mx,my-1)
                        if checkunit > 0{
                            if checkunit.team = 1{//if it's a player unit, it should have attacked
                                //show_message("should have attacked but didn't")
                                }
                            }
                        }
                    if mx < roomwidth-1{
                        checkunit = ds_grid_get(unitposgrid,mx+1,my)
                        if checkunit > 0{
                            if checkunit.team = 1{//if it's a player unit, it should have attacked
                                //show_message("should have attacked but didn't")
                                }
                            }
                        }
                    if my < roomheight-1{
                        checkunit = ds_grid_get(unitposgrid,mx,my+1)
                        if checkunit > 0{
                            if checkunit.team = 1{//if it's a player unit, it should have attacked
                                //show_message("should have attacked but didn't")
                                }
                            }
                        }
                    if mx > 0{
                        checkunit = ds_grid_get(unitposgrid,mx-1,my)
                        if checkunit > 0{
                            if checkunit.team = 1{//if it's a player unit, it should have attacked
                                //show_message("should have attacked but didn't")
                                }
                            }
                        }
                    }//end no attack debug
                }else{
                //buttons should be made when the unit is clicked
                //sMakeButtons(id)
                //sMakeInventoryButtons(id)
                }
            }//done with move to last tile
        }else{//if the unit will fall
        walking = 0
        waswalking = 1
        falling = 1
        walkstep = 0
        willfall = 0
        }
    }//done with end of tile action
