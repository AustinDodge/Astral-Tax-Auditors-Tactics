if instance_exists(oLevelUpWindow){
    
    if gainability = 0{
        //if the unit won't gain a ability, destroy the window and carry on
        canclick = 1
        instance_destroy()
        }else{
        mouse_clear(mb_left)
        if !instance_exists(oLearnAbilityWindow){
            sTileCursorSetPosition(target.mytile)
            //if the unit will gain a ability, do that stuff
            instance_create(oLevelUpWindow.x,oLevelUpWindow.y,oLearnAbilityWindow)
            oLearnAbilityWindow.myunit = target
            with oLearnAbilityWindow{
                event_perform(ev_other,ev_user0)
                }
            }
        }
    with oLevelUpWindow{
        instance_destroy()
        }
    }


