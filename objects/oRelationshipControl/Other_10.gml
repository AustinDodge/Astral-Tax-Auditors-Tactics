var vunit,vmap,vnum,vstart,vamount,startunitpos,vunitpos,midx,midy;


if instance_exists(startunit){
    startunitpos = sGetUnitListPosition(startunit)
    if ds_list_size(relationshiplist) > 0{
        instance_create(startunit.x,startunit.y,oHeartPump)
        while ds_list_size(relationshiplist) > 0{
            vunit = ds_list_find_value(relationshiplist,0)
            ds_list_delete(relationshiplist,0)
            if instance_exists(vunit){
                vunitpos = sGetUnitListPosition(vunit)
                
                vmap = vunit.relationshipmap
                vnum = ds_map_find_value(vmap,startunitpos)//the current relationship between units
                if vnum = undefined{
                    vnum = 0
                    }
                vstart = vnum
                vamount = sFindRelationshipIncreaseAmount(vnum,vunit,startunit)//the amount to increase the friendship by
                vnum += vamount
                //if the units have gone up a friendship level, add the unit to the uplist
                if floor(vnum) > floor(vstart){
                    ds_list_add(uplist,vunit)
                    }
                //change the relationship in both units
                ds_map_replace(vmap,startunitpos,vnum)
                vmap = startunit.relationshipmap
                ds_map_replace(vmap,vunitpos,vnum)
                //now make the particles
                midx = round(mean(vunit.x,startunit.x))
                midy = round(mean(vunit.y,startunit.y))
                //sMakeInterfaceParticle(startunit.x,startunit.y,midx,midy,oHeartParticle,-10000,3)
                //sMakeInterfaceParticle(vunit.x,vunit.y,midx,midy,oHeartParticle,-10000,3)
                instance_create(vunit.x,vunit.y,oHeartPump)
                }
            }
        }
    }
ds_list_destroy(relationshiplist)

