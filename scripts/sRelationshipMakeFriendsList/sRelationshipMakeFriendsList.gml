/// @description sRelationshipMakeFriendsList(vunit)
/// @param vunit
/*This script takes a unit and returns a list of all units close enough to that unit
for it to make friends with. If there are no units, the list is empty.*/

var vunit,vlist,cunit,vteam,vdist;

vunit = argument0
vlist = ds_list_create()

vteam = vunit.team
with oUnitParent{
    if team = vteam{
        if canmakefriends = 1{
            if id != vunit{
                vdist = vunit.relationshipdist
                if relationshipdist > vdist{
                    vdist = relationshipdist
                    }
                if sIsTileInProximity(mytile,vunit,vdist){
                    ds_list_add(vlist,id)
                    }
                }
            }
        }
    }
    
return vlist;
