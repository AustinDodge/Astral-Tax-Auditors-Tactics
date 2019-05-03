/// @description sUnitEndTurnAction(unit,dorelationships)
/// @param unit
/// @param dorelationships
/*Called to end a unit's turn after taking an action. Creates oActionControl and sets the 
appropriate variables. If dorelationships is set to one, adjacent units will have their
friendships increased.*/

var vunit,vrelationships;

vunit = argument0
vrelationships = argument1

instance_create(x,y,oActionControl)
oActionControl.startunit = vunit
oActionControl.relationshipunit = vunit//default
oActionControl.endunitwhendone = 1

if vrelationships = 1{
    if vunit.canmakefriends = 1{
        var vlist;
        //make the list of nearby units to add relationships to
        vlist = sRelationshipMakeFriendsList(vunit)
        if ds_list_size(vlist) > 0{
            oActionControl.dorelationships = 1
            oActionControl.relationshiplist = vlist
            }else{
            ds_list_destroy(vlist)
            }
        }
    }
