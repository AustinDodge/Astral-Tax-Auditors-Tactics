/// @description sAIMoveBestUnit()
/*this script is run during stage 2 of oAIControl. It starts by setting currentunit as the
unit with the highest priority in unitmovepriority, the unit with the best possible move
right now. It then runs again through sAIUnitPickBehavior to get the tile that unit should
move to. It then finds the moverange again and starts the unit moving to that tile.
Figuring out what to do at the end of the move is handled in the units step event.
*/
if movingaunit = 0{
    var vpos,vtile,tilemovelist,doobstacle;
    movingaunit = 1
    currentunit = 0
    doobstacle = 0
    if ds_priority_size(unitmovepriority) > 0{
        currentunit = ds_priority_delete_max(unitmovepriority)
        sunit = currentunit
        }else{
        show_message("unitmovepriority is empty!")
        }
    vpos = ds_list_find_index(unitlist,currentunit)
    if vpos = -1{
        //show_message("Moving unit wasn't on unitlist!")
        }
    ds_list_delete(unitlist,vpos)
    if ds_list_find_index(unitlist,currentunit) >= 0{
        show_message("Unit wasn't deleted!")
        }
    ds_list_add(doneunitlist,currentunit)
    unitlistsize = ds_list_size(unitlist)
    unitlistpos = 0//reset unitlistpos so stage 1 will start from zero
    
    if ds_list_find_index(doneunitlist,currentunit) >= 0{
        //show_message("Done unit is on unitlist!")
        }
    //show_message("unitmovepriority size is "+string(unitmovepriority)+", should be 0")
    
    
    currentunitcanattack = 0
    bestattacktile = 0
    bestmovetile = 0
    
    if ds_list_find_index(obstacleunitslist,currentunit) >= 0{
        doobstacle = 1
        }
    
    sDestroyRangeTiles()
    tilemovelist = ds_list_create()
    sunit = currentunit
    //now we essentially have the unit we picked with the best move run through their behavior
    //again so we can find the proper tile.
    sFindMoveRange(currentunit)
    with oMapTile{
        if cango = 1 and occupied = 0{//add all movable tiles to tilemovelist
            ds_list_add(tilemovelist,id)
            }
         if cango = 1 and occupied = sunit{//have the unit consider the tile it's on
            ds_list_add(tilemovelist,id)
            }
        if canattack = 1{
            if attackable = 1{//if the tile contains an enemy unit, that means this unit can attack
                if occupied.team != 2{//if occupied unit is a player unit, can attack. Change this later
                //when you have a better way of determining who a unit should attack.
                
                    oAIControl.currentunitcanattack = 1
                    }
                //show_message("should be attacking")
                }
            }
        }
    
    sDestroyRangeTiles()
    
    if doobstacle = 0{
        sAIPickUnitBehavior(currentunit,tilemovelist)
        }else{
        currentunitcanattack = 1
        sAIUnitObstacleBehavior(currentunit,tilemovelist)
        }
    //instance_create(bestmovetile.x,bestmovetile.y,oTileCursorTempDebug)
    //if bestattacktile > 0{
        //instance_create(bestattacktile.x,bestattacktile.y,oTileCursorTempDebug)
        //}
    //oTileCursorTempDebug.depth = -10000
    
    //now we have the best tile to move to and to attack to, if applicable. Find the units
    //moverange then have the unit move to that tile.
    sDestroyRangeTiles()
    sFindMoveRange(currentunit)
    with oAttackRange{
        instance_destroy()
        }
    if bestmovetile.occupied != currentunit{//if currentunit isn't already on the best tile
        sClickOnMoveRange(bestmovetile)
        }else{//if the unit is already on the best tile it can be on
        with currentunit{
            sDestroyRangeTiles()
            sFindAttackRange(id,mytile)
            sMakeAttackRange(weaponhealing)
            }
        with oAttackRange{
            if active = 0{
                instance_destroy()
                }
            }
        if !instance_exists(oAttackRange){
            movingaunit = 2
            }else{//if there is a valid attack
            if bestattacktile > 0{
                sClickOnAttackable(currentunit,bestattacktile.occupied)
                with oAttackWindow{
                    event_perform(ev_other,ev_user3)
                    }
                }else{//if an attack can happen but doesn't
                //show_message("can attack but not attacking")
                movingaunit = 2
                }
            }
        }
    ds_list_destroy(tilemovelist)
    }
if movingaunit = 2{//if the unit has finished moving
    //with oTileCursorTempDebug{
        //instance_destroy()
        //}
    movingaunit = 0
    stage = 1
    currentunit = 0
    currentunitcanattack = 0
    bestattacktile = 0
    bestmovetile = 0
    sunit = 0
    ds_priority_clear(unitmovepriority)
    ds_list_clear(obstacleunitslist)
    ds_map_clear(obstacleunitmap)
    }

