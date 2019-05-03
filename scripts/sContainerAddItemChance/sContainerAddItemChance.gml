/// @description sContainerAddItemChance(list,item,howmany)
/// @param list
/// @param item
/// @param howmany
/*This script adds the specified item index to the specified list the specified number of 
times. Called from sRedChestPickItem.
*/
var vlist,vitem,howmany,i;

vlist = argument0
vitem = argument1
howmany = argument2

for (i = 0; i < howmany; i += 1){
    ds_list_add(vlist,vitem)
    }
