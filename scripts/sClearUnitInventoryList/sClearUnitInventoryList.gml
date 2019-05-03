/// @description sClearUnitInventoryList(vlist)
/// @param vlist
/*This script destroys all the lists contained in a unit's inventorylist. It must be called
before the inventorylist is destroyed, otherwise there will be no way to access the items
on it!
*/

var vlist,ilist;

ilist = argument0

while ds_list_size(ilist) > 0{
    vlist = ds_list_find_value(ilist,0)
    ds_list_destroy(vlist)
    ds_list_delete(ilist,0)
    }
