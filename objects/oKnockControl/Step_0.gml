var vsize,i,vunit;
vsize = ds_list_size(doneknockedlist)
if ds_list_empty(knockedlist){
    vsize = ds_list_size(doneknockedlist)
    //show_message("gonna give "+string(vsize)+" units damage!")
    for (i = 0; i < ds_list_size(doneknockedlist); i += 1){
        vunit = ds_list_find_value(doneknockedlist,i)
        if instance_exists(vunit){
            sDrawUnitAttackHP(vunit,vunit.knockdamage)
            vunit.knockdamage = 0
            }
        }
        
    instance_destroy()
    
    }


