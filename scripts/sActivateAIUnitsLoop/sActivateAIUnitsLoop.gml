/// @description sMapActivateAIUnits()

/****NEW NOTE!!!
THis script is now obsolete due to oAIActivationControl, but remains in for compatibility.
All it does is advance the stage.
*/




/*This script finds the AI units that are capable of attacking player units
and "activates" them. They'll be available to the AI immediately in the map. 
It is only run by oAIControl.
*/
var vgrid,vunit,vturn;

stage += 1


/*
vturn = playerturn
vgrid = ds_grid_create(roomwidth,roomheight)
ds_grid_clear(vgrid,0)
vunit = -1
if ds_list_size(inactiveunitlist) > 0{
    vunit = ds_list_find_value(inactiveunitlist,0)
    ds_list_delete(inactiveunitlist,0)
    }else{
    stage += 1
    }
//now activate any units that can currently reach or attack player units
playerturn = 2
/*if vunit != -1{
    if vunit.aiactivated = 0{
        with vunit{
            sDestroyRangeTiles()
            vunit = id
            sunit = id
            ds_grid_clear(vgrid,0)
            if team = 2{
                sFindMoveRange(id)
                }
            with oMapTile{
                if cango = 1{
                    if occupied = 0 or occupied = vunit{
                        sFindAttackRange(vunit,id)
                        sMakeAttackRange()
                        }
                    }
                if canattack = 1 or cango = 1{
                    if occupied > 0{
                        if occupied.team = 1{
                            vunit.aiactivated = 1
                            ds_list_add(oAIControl.unitlist,vunit)
                            oAIControl.unitlistsize = ds_list_size(oAIControl.unitlist)
                            }
                        }
                    }
                }
            }
        }
    }*/
//with oUnitParent{
//    if aiactivated = 0{
//        turnover = 1
//        }
//    }
//ds_grid_destroy(vgrid)
//sDestroyRangeTiles()
//playerturn = 1
//if donemakingroom = 1{
//    playerturn = vturn
//    }
    
