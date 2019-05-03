var vstring,vunit;
if instance_exists(oXPControl){
    if instance_exists(oXPControl.target){
        vstring = "+"+string(totalxp) + " XP"
        vunit = oXPControl.target
        if totalxp > 0{
            if totalxp + vunit.xp >= vunit.nextxp{//if the unit gains enough XP to gain a level
                vstring = vstring+"!!!"
                }
            draw_set_color(c_white)
            draw_text(x,y,string_hash_to_newline(vstring))
            }
        }
    }else{//destroy if there's no oXPControl
    instance_destroy()
    }

