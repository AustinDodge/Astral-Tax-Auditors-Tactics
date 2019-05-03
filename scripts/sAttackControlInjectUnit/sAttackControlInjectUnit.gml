/// @description sAttackControlInjectUnit(unit,injector,position)
/// @param unit
/// @param injector
/// @param position
/*This script injects another unit into oAttackControl's attack unit list.
The injected unit will attempt to attack the same target that the injector is targeting.
Inject at position 0 to have it attack next.
*/

var vunit,vinjector,vpos,vtarget;
with oAttackControl{
    vunit = argument0
    vinjector = argument1
    vpos = argument2
    
    vtarget = ds_map_find_value(targetmap,vinjector)
    
    ds_list_insert(attackerlist,vpos,vunit)
    ds_map_add(targetmap,vunit,vtarget)
    }
