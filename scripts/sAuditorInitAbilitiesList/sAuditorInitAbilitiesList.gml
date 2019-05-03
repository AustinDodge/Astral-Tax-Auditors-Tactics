/// @description sAuditorInitAbilitiesList(list)
/// @param list
/*This script loads the auditor ability list with the initial abilities it will have. Primarily
used for testing and debugging.
*/

var vlist;

vlist = argument0

//ds_list_replace(vlist,42,1)//first aid
ds_list_replace(vlist,46,1)//diversion
ds_list_replace(vlist,18,1)//shove

//ds_list_replace(vlist,18,1)//shove
/*
//ds_list_replace(vlist,29,1)//sneaky
ds_list_replace(vlist,18,1)//shove
ds_list_replace(vlist,33,1)//booster
ds_list_replace(vlist,34,1)//lifter
//ds_list_replace(vlist,25,1)//inner calm
ds_list_replace(vlist,30,1)//Wait for Me
ds_list_replace(vlist,42,1)//first aid 1
ds_list_replace(vlist,35,1)//sure footing
ds_list_replace(vlist,28,1)//taste for combat
ds_list_replace(vlist,37,1)//sprint
ds_list_replace(vlist,36,1)//nimble
ds_list_replace(vlist,41,1)//leap
ds_list_replace(vlist,48,1)//charmer
ds_list_replace(vlist,47,1)//blend in
ds_list_replace(vlist,46,1)//diversion
ds_list_replace(vlist,40,1)//hurdler
ds_list_replace(vlist,53,1)//reflexes
ds_list_replace(vlist,54,1)//adrenaline
/*
//ds_list_replace(vlist,1,1)//climber 1 
//ds_list_replace(vlist,3,1)//climber 3
//ds_list_replace(vlist,4,1)//return fire
//ds_list_replace(vlist,5,1)//kong
ds_list_replace(vlist,6,1)//trick shot
ds_list_replace(vlist,7,1)//rebound
ds_list_replace(vlist,9,1)//cliffhanger 2


ds_list_replace(vlist,22,1)//demolitons expert

ds_list_replace(vlist,27,1)//hard to kill
