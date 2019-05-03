/// @description sRedChestPickItem()
/*This script is run by each red chest at the start of the map to determine what sort
of item it has inside it. It creates a list, populates it with varying amounts of different
item indexes, then shuffles the list and spits out the index at the top.
*/
var vlist,i;
vlist = ds_list_create()

sContainerAddItemChance(vlist,7,9)//medkits
    
sContainerAddItemChance(vlist,8,9)//grenades

sContainerAddItemChance(vlist,1,10)//crowbar

sContainerAddItemChance(vlist,2,10)//electrobar

sContainerAddItemChance(vlist,3,10)//cursed bar

sContainerAddItemChance(vlist,4,10)//nail gun

sContainerAddItemChance(vlist,5,10)//weld gun

sContainerAddItemChance(vlist,6,10)//cursed cutter
    
ds_list_shuffle(vlist)

i = ds_list_find_value(vlist,0)

ds_list_destroy(vlist)

return i;
