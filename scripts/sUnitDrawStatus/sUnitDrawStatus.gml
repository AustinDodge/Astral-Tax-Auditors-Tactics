/// @description sUnitDrawStatus(vunit,status,turns)
/// @param vunit
/// @param status
/// @param turns
/*This script is called when a unit has a status effect added. It creates a status effect
object if the unit doesn't already have one, and adds it to the status icon's status rotation.
It also actually sets the status variables in the unit itself. This script will always set the
showstatus variables to true.
*/

var vunit,vstatus,howmany;
vunit = argument0
vstatus = 0
vtype = argument1
howmany = argument2

if vunit.mystatus = 0{
    vstatus = instance_create(vunit.x,vunit.y-10,oStatusIcon)
    vstatus.myunit = vunit
    vunit.mystatus = vstatus
    switch vtype{
        case 0: vstatus.sprite_index = sstunicon; break;
        case 1: vstatus.sprite_index = spgrenade; break;
        }
    }else{
    vstatus = vunit.mystatus
    }
switch vtype{
    case 0: vunit.stunnedstatus = howmany; vunit.showstunnedstatus = 1; break;
    case 1: vunit.explodestatus = howmany; vunit.showexplodestatus = 1; break;
    }
    
if ds_list_find_index(vstatus.statuslist,vtype) = -1{
    ds_list_add(vstatus.statuslist,vtype)
    
    }


