/// @description sAITileCheckLoop()
/*This script checks a single unit for its best move.
*/
var tilemovelist,vcandoti,vtile,doobstacle;
if unitlistsize > 0{//if there are any units left to move
    currentunitcanattack = 0
    vcandoit = 1
    doobstacle = 0
    
    tilemovelist = ds_list_create()
    currentunit = ds_list_find_value(unitlist,unitlistpos)
    if ds_list_find_index(doneunitlist,currentunit) >= 0{
        show_message("in tilecheckloop, Done unit is on unitlist!")
        }
    sunit = currentunit
    
    if currentunit = undefined{
        show_message("currentunit is undefined!")
        vcandoit = 0
        }
        
    if ds_list_find_index(obstacleunitslist,currentunit) >= 0{
        doobstacle = 1
        }
    
    sDestroyRangeTiles()
    if vcandoit = 1{
        sFindMoveRange(currentunit)
        if instance_exists(oAttackRange){
            //show_message("there are attackranges...")
            }
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
                    //modified, previously it only saw if it could attack the player, now it checks if it can attack anything not on its team
                    //when you have a better way of determining who a unit should attack.
                    
                        oAIControl.currentunitcanattack = 1
                        }
                    //show_message("should be attacking")
                    }
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
    
    if currentunitcanattack = 0{//if the unit won't attack
        if currentunit.explodestatus = 0{//if the unit won't blow up attacking
            if ds_list_find_index(obstacleunitslist,currentunit) < 0{//check if the unit is blocked by an obstacle
                vtile = sAICheckAdjacentTilesObstacles(bestmovetile,obstaclemap)
                if vtile > 0{
                    unitlistpos -= 1
                    ds_list_add(obstacleunitslist,currentunit)
                    ds_map_add(obstacleunitmap,currentunit,vtile)
                    obstacletile = vtile
                    }
                }
            }
        }
    
    unitlistpos += 1
    if currentunitcanattack = 0{
        //stage = 5//debug
        }
    
    if unitlistpos >= unitlistsize{
        stage = 3
        }
    ds_list_destroy(tilemovelist)
    //drawaiscorelist = tilemovelist//debug
    }else{//if there are no move units on unitlist
    instance_destroy()
    }

