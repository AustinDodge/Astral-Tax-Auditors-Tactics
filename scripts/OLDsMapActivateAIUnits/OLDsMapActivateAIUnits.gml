/// @description sMapActivateAIUnits()
/*This script finds the AI units within the players immediate movement and attack range
and "activates" them. They'll be available to the AI immediately in the map. 
*/
var vgrid,vunit,vturn,iunit,vrange;
vturn = playerturn
vgrid = ds_grid_create(roomwidth,roomheight)
iunit = 0
with oAuditor{
    iunit = id
    }
if iunit = 0{//if there is no auditor to be iunit
    with oUnitParent{
        if team = 1{
            iunit = id
            }
        }
    }
if iunit = 0{//if there is no player unit, use any unit just to not crash
    iunit = instance_nearest(x,y,oUnitParent)
    }
ds_grid_clear(vgrid,0)
with oUnitParent{
    sDestroyRangeTiles()
    if team = 1{
        sunit = id
        vunit = id
        sFindMoveRange(id)
        
        with oMapTile{
            if cango = 1{
                if occupied = 0 or occupied = vunit{
                    sFindAttackRange(vunit,id)
                    sMakeAttackRange(vunit.weaponhealing)
                    }
                }
            if canattack = 1{
                ds_grid_set(vgrid,mx,my,1)
                }
            if cango = 1{
                ds_grid_set(vgrid,mx,my,1)
                }
            }
        }
    }

with oUnitParent{//any AI units that can be attacked by the player is activated
    if ds_grid_get(vgrid,mx,my) = 1{
        aiactivated = 1
        }
    }
//now activate any units that can currently reach, see or attack player units
playerturn = 2
var vdist;
with oUnitParent{
    sDestroyRangeTiles()
    vunit = id
    sunit = id
    ds_grid_clear(vgrid,0)
    vrange = moverange
    if team = 2{
        moverange = visionrange
        sFindMoveRange(id)
        }
    
    with oMapTile{//activate units that can reach or attack player units
        if cango = 1{
            if occupied = 0 or occupied = vunit{
                sFindAttackRange(vunit,id)
                sMakeAttackRange(vunit.weaponhealing)
                }
            }else{//set tiles that are in the unit sightrange to "cango" for activation purposes
            vdist = abs(mx - vunit.mx) + abs(my - vunit.my)
            if vdist <= vunit.moverange+1{//not including the unit's attack range for now
                if sCheckLineOfSight(vunit.mytile,id,vunit,iunit) = 1{
                    cango = 1
                    }
                }
            }
        
        if canattack = 1 or cango = 1{
            if occupied > 0{
                if occupied.team = 1{
                    vunit.aiactivated = 1
                    }
                }
            }
        }
    //now activate units that can see player units
    sDestroyRangeTiles()
    
    moverange = vrange
    
    }
with oUnitParent{
    if aiactivated = 0{
        turnover = 1
        }
    }
ds_grid_destroy(vgrid)
sDestroyRangeTiles()
playerturn = 1
with oUnitParent{//now make the influence maps for any units that don't start activated
    if team = 2{
        if aiactivated = 0{
            vrange = moverange
            moverange = visionrange
            myinfluencemap = ds_grid_create(roomwidth,roomheight)
            vunit = id
            sunit = id
            ds_grid_clear(myinfluencemap,0)
            //sFindMoveRange(id)
            with oMapTile{
                //cango = 0
                vdist = abs(mx - vunit.mx) + abs(my - vunit.my)
                if vdist <= vunit.moverange+1{//not including the unit's attack range for now
                    if sCheckLineOfSight(vunit.mytile,id,vunit,iunit) = 1{
                        //cango = 1
                        ds_grid_set(vunit.myinfluencemap,mx,my,1)
                        }
                    }
                }
            moverange = vrange
            //with oMapTile{
                /*if cango = 1{
                    if occupied = 0 or occupied = vunit{
                        sFindAttackRange(vunit,id)
                        sMakeAttackRange()
                        }
                    }*/
                //if canattack = 1 or cango = 1{
                //if cango = 1{
                    
                 //   }
                //}
            }
        }
    }
sDestroyRangeTiles()
if donemakingroom = 1{
    playerturn = vturn
    }
    
