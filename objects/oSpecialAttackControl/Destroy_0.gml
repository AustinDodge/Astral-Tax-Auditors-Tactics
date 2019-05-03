var vunit;

pausemove = 0

if ds_list_size(defenderlist) = 1{//if there is a single unit in Defenderlist to consider
    vunit = ds_list_find_value(defenderlist,0)
    if instance_exists(vunit){
        //re-attempt Trick Shot in case there are multiple controls
        sTrickShotMakeAttack(ds_list_find_value(defenderlist,0))
        }
    }


ds_list_destroy(attackerlist)
ds_list_destroy(defenderlist)
ds_list_destroy(unitlist)
ds_map_destroy(targetmap)
ds_map_destroy(hitmap)




if mycaller > 0{
    with mycaller{
        instance_destroy()
        }
    }

