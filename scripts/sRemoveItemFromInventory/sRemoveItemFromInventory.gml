/// @description sRemoveItemFromInventory(vunit,itemlistpos)
/// @param vunit
/// @param itemlistpos
/*This script removes an item from a unit's inventory.
It DOES NOT destroy or remake the buttons that represent the inventory,
so this script can be used behind the scenes or in other situations.
It DOES NOT destroy the data associated with the inventory position, although
it does remove that from the list! The data needs to be handled later, although
that shouldn't be a problem since this should only be used when taking an item
from the inventory to be used on the map - the instance should handle the data.
Its verysimple now, but inventory stuff might get complicated in the future,
so I'm putting it in its own script now. 
*/

var vunit,vpos,vlist;

vunit = argument0
vpos = argument1

vlist = vunit.inventorylist
ds_list_delete(vlist,vpos)


