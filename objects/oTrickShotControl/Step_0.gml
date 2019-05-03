
if findingtarget = 1{
    var iseligible,vclick,vcontrol;
    
    iseligible = 0
    ptile = sGetTileUnderCursor()
    vclick = 0
    if mouse_check_button_pressed(mb_right) = 1{
        mouse_clear(mb_right)
        vclick = 1
        }
    if mouse_check_button_pressed(mb_left) = 1{
        mouse_clear(mb_left)
        vclick = 2
        }
    if ptile > 0{
        stile = ptile
        sTileCursorSetPosition(ptile)
        if ptile.occupied <= 0{//if there's nothing in ptile
            if ptile.canattack = 1{
                iseligible = 1
                }
            
            if ptile.object_index = oPitTile{
                iseligible = 0
                }
            
            //now we have an unoccupied non-pit tile selected
            if vclick = 1{//if the unit right-clicked the tile
                if iseligible = 1{
                    //select target tile and destroy info window, resume turn
                    targettile = ptile
                    findingtarget = 0
                    foundtarget = 1
                    myindicator = instance_create(targettile.x,targettile.y,oTrickShotIndicator)
                    myindicator.depth = -9998
                    sDestroyRangeTiles()
                    sUnitEndTurnAction(myunit,0)
                    with mywindow{
                        instance_destroy()
                        }
                    
                    }//end right-clicking over eligible tile
                }
            }
        }
    if vclick = 2{//if the player is canceling
        sDestroyRangeTiles()
        with mywindow{
            instance_destroy()
            }
        instance_destroy()
        sClickOnPlayerUnit(myunit)
        }
        
    }else{
        if foundtarget = 1{
            }
    //if a target has been found
    }

