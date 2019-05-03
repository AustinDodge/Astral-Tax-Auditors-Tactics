/// @description sAddItemToInventory(vunit,itemdata)
/// @param vunit
/// @param itemdata
/*This script adds an item to a unit's inventory.
It's very simple now, essentially just a ds_list_add call, but it's its own
script so that the inventory system can be easily changed later if necessary.
*/

var vunit,vdata,vlist;

vunit = argument0
vdata = argument1

vlist = vunit.inventorylist

ds_list_add(vlist,vdata)
