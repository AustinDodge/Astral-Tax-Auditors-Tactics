/// @description sAbilitiesUsedRoomStart(vunit)
/// @param vunit
/*resets the entries on a unit's abilitiesusedlist that have per-room uses to 0. Called when
initially making units.
*/

var vlist,vunit;

vunit = argument0
vlist = vunit.abilitiesusedlist

ds_list_replace(vlist,8,0)//cliffhanger 1
ds_list_replace(vlist,9,0)//cliffhanger 2
ds_list_replace(vlist,10,0)//cliffhanger 3

ds_list_replace(vlist,27,0)//hard to kill
ds_list_replace(vlist,30,0)//wait for me

