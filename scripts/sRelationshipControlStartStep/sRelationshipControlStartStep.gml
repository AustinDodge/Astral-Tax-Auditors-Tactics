/// @description sRelasionshipControlStartStep()
/*Run when considering a new unit to increase relationships. Pick the unit at the start of
unitlist, add it to donelist, then check if there are any units close enough to befriend
that aren't on donelist already.*/

var vunit,vteam,vlist,vdist,vdone;
vteam = team
vlist = donelist
vdist = 2//the proximity units need to have to make friends
vfinished = 0

ds_list_clear(friendlist)

if ds_list_size(unitlist) > 0{
    currentunit = ds_list_find_value(unitlist,0)
    vunit = currentunit
    ds_list_add(donelist,currentunit)
    with oUnitParent{
        if team = vteam{
            if !ds_list_find_index(vlist,id){
                if sIsTileInProximity(vunit.mytile,id,2){
                    ds_list_add(oRelationshipControl.friendlist,id)
                    }
                }
            }
        }
    }
