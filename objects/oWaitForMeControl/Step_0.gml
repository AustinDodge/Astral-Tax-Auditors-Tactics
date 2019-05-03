var i,vunit;

with oMoveRange{
    visible = 0
    }

if done = 0{
    done = 1
    for (i = 0; i < ds_list_size(unitlist); i += 1){
        vunit = ds_list_find_value(unitlist,i)
        if vunit.moving = 1{//if the unit is still moving
            done = 0
            }
        }
    }else{
    ds_list_destroy(unitlist)
    canclick = 1
    sTramAnimate(1)
    instance_destroy()
    }


