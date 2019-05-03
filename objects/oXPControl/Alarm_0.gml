if noactions = 1{//if there is still nothing happening when the alarm goes off
    if instance_exists(target){
        //do the XP stuff
        //show_message("did XP stuff! total xp gain is "+string(targetxpgain))
        tallydone = 1
        if instance_exists(oDrawXP){
            with oDrawXP{
                instance_destroy()
                }
            }
        ds_list_destroy(xplist)
        
        //DEBUG
        //targetxpgain = 100
        
        target.xp += targetxpgain
        if target.xp < target.nextxp{//if the unit hasn't gained enough XP to level up
            instance_destroy()
            }else{//if the unit will level up
            gainability = 1//debug, always learn ability
            while target.xp >= target.nextxp{
                target.xp -= target.nextxp
                levelsup += 1
                }
            instance_create(x,y,oLevelUpWindow)
            oLevelUpWindow.target = target
            oLevelUpWindow.levelsup = levelsup
            with oLevelUpWindow{
                event_perform(ev_other,ev_user0)
                }
            //alarm[1] = 200
            canclick = 0
            tallydone = 1
            //insert other level up stuff
            }
        }else{//if the target has been killed
            ds_list_destroy(xplist)
            instance_destroy()
            }
    }

