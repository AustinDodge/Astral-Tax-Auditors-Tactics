var vopen,vabilities,vstats;
vopen = 1//if the box should open or close, 1 by default
vabilities = 0
vstats = 0
if imouse_x > x+60{
    if imouse_y > y+64{//the mouse is over the tabs
        if imouse_y > y+115{//over the stats tab
            vstats = 1
            showwhich = 0
            with oAbilityIcon{
                instance_destroy()
                }
            }else{//over the abilities tab
            vabilities = 1
            showwhich = 1
            event_perform(ev_other,ev_user0)
            }
        
        if open = 1{
            //if the window is already open and the player is clicking tabs,
            //dont close it
            vopen = 0
            }
        }
    }

if vopen = 1{
    if open = 0{
        open = 1
        }else{
        open = 0
        }
    }

