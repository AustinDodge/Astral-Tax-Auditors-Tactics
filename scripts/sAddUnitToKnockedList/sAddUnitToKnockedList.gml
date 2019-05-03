/// @description sAddUnitToKnockedList(unit)
/// @param unit
/*This script is called every time a unit or object is knocked, adding it to
oKnockControl's knocklist. If oKnockControl doesn't exist, it's created.
*/
var vunit,vpos;
vunit = argument0
if !instance_exists(oKnockControl){
    instance_create(0,0,oKnockControl)
    }
vpos = ds_list_find_index(oKnockControl.knockedlist,vunit)
if vpos < 0{
    ds_list_add(oKnockControl.knockedlist,vunit)
    vpos = ds_list_find_index(oKnockControl.knockedlist,vunit)
    }
vunit.anim = 4
