/// @description sRelationshipAddUnit(unit)
/// @param unit
/*This script is ran anywhere that the relationship between two units should be
increased - when item are used, when specific actions are taken, etc. It adds vunit
to the list of units that oActionControl will pass to oRelationshipControl.
*/

var vunit;
vunit = argument0
if vunit.canmakefriends = 1 and vunit.team = 1{
    if instance_exists(oActionControl) and !instance_exists(oRelationshipControl){
        if oActionControl.alldone = 0{
            with oActionControl{
                if !ds_exists(relationshiplist,ds_type_list){
                    relationshiplist = ds_list_create()
                    }
                dorelationships = 1
                }
            ds_list_add(oActionControl.relationshiplist,vunit)
            }
        }
    }
