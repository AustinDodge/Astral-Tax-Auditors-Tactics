var i,vsize,vunit;
vsize = 0

if victimslist > 0{
    vsize = ds_list_size(victimslist)
    for (i = 0; i < vsize; i += 1){
        vunit = ds_list_find_value(victimslist,i)
        sDrawUnitAttackHP(vunit,vunit.knockdamage)
        }
    //ds_list_destroy(victimslist)
    
    }
activated = 1

