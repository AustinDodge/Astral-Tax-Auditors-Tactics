/// @description sRelationshipControlInit()
/*create a list of all units on the current team for whom canmakefriends = 1.
*/
var vteam,vlist;
vteam = team
vlist = unitlist
with oUnitParent{
    if team = vteam{
        if canmakefriends = 1{
            ds_list_add(vlist,id)
            }
        }
    }
