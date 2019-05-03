/// @description sRelationshipAddProximity(startunit)
/// @param startunit
/*This script is ran when an action is taken that will make all units in proximity
increase their relationship.*/
var vunit,vlist;
vunit = argument0

if vunit.team = 1{
        if vunit.canmakefriends = 1{
            //make the list of nearby units to add relationships to
            vlist = sRelationshipMakeFriendsList(vunit)
            if ds_list_size(vlist) > 0{
                if !instance_exists(oActionControl){
                    instance_create(x,y,oActionControl)
                    }
                oActionControl.dorelationships = 1
                oActionControl.relationshiplist = vlist
                oActionControl.relationshipunit = vunit
                }else{
                ds_list_destroy(vlist)
                }
            }
        }
