var vlist,vunit,vtile,tlist,gtile,i,vicon;
vlist = unitlist
vunit = startunit
ds_list_add(vlist,startunit)
vtile = vunit.mytile
gtile = vtile//gtile is the startunits tile

tlist = sTileGetNeighborList(vtile)
if inelevator = 0{//if the unit isn't in an elevator, normal target eligibility
    while ds_list_size(tlist) > 0{
        vtile = ds_list_find_value(tlist,0)
        ds_list_delete(tlist,0)
        vunit = vtile.occupied
        if vunit > 0{
            if vunit.team = startunit.team or vunit.isauditor = 1{//if the unit is on the same team
                if abs(vtile.elevation - gtile.elevation) <= 2{//if the unit's tile is close enough vertically
                    //the unit can be healed
                    ds_list_add(vlist,vunit)
                    }
                }
            }
        }
    }else{
    //if the unit is in an elevator, use abilities on all units also in elevator
    with oUnitParent{
        if team = vunit.team or vunit.isauditor = 1{
            ds_list_add(vlist,id)
            }
        }
    }

//unitlist is now populated with all units that can be healed
if ds_list_size(unitlist) > 0{
    //draw the cursor over all units
    for (i = 0; i < ds_list_size(unitlist); i += 1){
        vunit = ds_list_find_value(unitlist,i)
        vicon = instance_create(vunit.x,vunit.y,oHealIcon)
        vicon.myunit = vunit
        }
    }

















