/// @description sGetUnitRelationshipLevel(unit1,unit2,allowbonus)
/// @param unit1
/// @param unit2
/// @param allowbonus
/*Returns the relationship level(floored) between two units. allowbonus is for combat
determinations, when displaying information for the player you may want to only show
the base relationship levels.
*/

var vunit1,vunit2,vamount,vpos1,vpos2,vbonus;

vunit1 = argument0
vunit2 = argument1
vbonus = argument2

vpos1 = sGetUnitListPosition(vunit1)
vamount = ds_map_find_value(vunit2.relationshipmap,vpos1)
if vamount = undefined{
    vamount = 0
    }
vamount = floor(vamount)
if vbonus = 1{//if bonus abilities apply
    if vamount < 3{
        if ds_list_find_value(vunit1.abilitiesusedlist,48) = 1{
            vamount = 3
            }
        if ds_list_find_value(vunit2.abilitiesusedlist,48) = 1{
            vamount = 3
            }
        }
    }

return vamount;
