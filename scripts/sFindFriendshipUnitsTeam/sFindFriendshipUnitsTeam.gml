//sFindFriendshipUnitsTeam(team)
/*This script returns a list of all units on a team that are close enough to
another unit to improve their relationship.
*/

var vlist,vteam,vunit,vfriend,vteamlist,vsize,i,j,vdist;

vlist = ds_list_create()
vteamlist = ds_list_create()
vteam = argument0

vdist = 1

with oUnitParent{
    if team = vteam{
        ds_list_add(vteamlist,id)
        }
    }


vsize = ds_list_size(vteamlist)
for(i = 0; i < vsize; i += 1){
    vunit = ds_list_find_value(vteamlist,i)
    for(j = 0; j < vsize; j += 1){
        vfriend = ds_list_find_value(vteamlist,i)
        if vfriend != vunit{
            if sIsTileInProximity(vfriend.mytile,vunit,vdist){
                if !ds_list_find_index(vlist,vunit){
                    ds_list_add(vlist,vunit)
                    j = vsize
                    }
                }
            }
        }//end for j
    }//end for i
ds_list_destroy(vteamlist)
return vlist;
