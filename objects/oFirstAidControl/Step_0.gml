
var vunit,vtile;

if targetfound = 0{
    vtile = sGetTileUnderCursor()
    vunit = -1
    if vtile > 0{
        vunit = vtile.occupied
        sTileCursorSetPosition(vtile)
        }
    
    
    if mouse_check_button_pressed(mb_right){
        if vunit > 0{//if there is a unit under the cursor
            if ds_list_find_index(unitlist,vunit) >= 0{//if that unit can be healed
                targetunit = vunit
                targetfound = 1
                event_perform(ev_other,ev_user2)
                }
            }
        }//end right click check
        
    
    if mouse_check_button_pressed(mb_left){
        if targetfound = 0{//double check that a target wasn't found this step
            event_perform(ev_other,ev_user1)
            }
        }
    }


