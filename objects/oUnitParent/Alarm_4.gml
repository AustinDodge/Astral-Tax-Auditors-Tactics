var vpos;


if bouncing = 0 and amknocked = 0 and falling = 0 and fallingpit = 0 and pausemove = 0{
    anim = 1
    if instance_exists(oKnockControl){
        vpos = ds_list_find_index(oKnockControl.knockedlist,id)
        if vpos > -1{
            while vpos > -1{
                ds_list_delete(oKnockControl.knockedlist,vpos)
                vpos = ds_list_find_index(oKnockControl.knockedlist,id)
                }
            if knockdamage > 0{
                ds_list_add(oKnockControl.doneknockedlist,id)
                anim = 4
                }
            }
        }
    }else{
    alarm[4] = 20
    }


