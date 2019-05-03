/// @description sMakeItemData(itemnum,uses)
/// @param itemnum
/// @param uses
/*This script creates the list data structure for an item being created on the map.
For the default max durability of the item, make uses -1.

Currently the list only contains the itemnum and the number of uses the item has.

Returns the list ID.
*/

var vlist,vuses,vtarget,vitem;

vitem = argument0
vuses = argument1
if vuses = -1{
    vuses = sGetItemInfo(vitem,5)
    }

vlist = ds_list_create()
ds_list_add(vlist,vitem,vuses)

return vlist;
