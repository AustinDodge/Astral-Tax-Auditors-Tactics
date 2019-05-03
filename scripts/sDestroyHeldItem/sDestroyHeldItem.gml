/// @description sDestroyHeldItem(vunit,itemdata,0weapon 1armor 2 inventory)
/// @param vunit
/// @param itemdata
/// @param 0weapon 1armor 2 inventory
/*This script is called to destroy an item that a unit is currently carrying.
*/

var vlist,vsection,vunit,vpos;

vunit = argument0
vlist = argument1
vsection = argument2

ds_list_destroy(vlist)
switch vsection{
    case 0: vunit.myweaponlist = -1; vunit.myweapon = 0; break;
    case 1: vunit.myarmorlist = -1; vunit.myarmor = 0; break;
    case 2: vpos = ds_list_find_index(vunit.inventorylist,vlist); ds_list_delete(vunit.inventorylist,vpos); break;
    }
