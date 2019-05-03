if !instance_exists(oHeartPump){
    if wentup = 0{
        var vnum,vstartpos,vunitpos,vunit,vname1,vname2,vmap;
        if ds_list_size(uplist) > 0{
            wentup = 1
            canclick = 0
            instance_create(x,y,oRelationshipUpWindow)
            oRelationshipUpWindow.target = startunit
            oRelationshipUpWindow.friendlist = uplist
            }else{
            ds_list_destroy(uplist)
            instance_destroy()
            }
        }
    }

