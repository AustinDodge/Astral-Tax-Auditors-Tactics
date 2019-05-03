/// @description sMakeUnitMapItem(vunit,item number,targetunit)
/// @param vunit
/// @param item number
/// @param targetunit
/*This script makes an item on a unit's location, for manipulation of inventory;
example, if a player will be discarding an item. Returns the instance ID of the item.
Targetunit will usually be changed by the time anything is done with the item, defaults to
current unit.
*/
var vunit,vtype,vtargetunit,vobj,vitem;

vunit = argument0
vtype = argument1
vtargetunit = argument2

vobj = sGetItemInfo(vtype,3)
vitem = instance_create(vunit.x,vunit.y-28,vobj)
vitem.itemtype = vtype
vitem.targetunit = vunit
vitem.startunit = vunit
vitem.depth = vunit.depth-1

with vitem{
    event_perform(ev_other,ev_user0)
    }
    

return vitem;

