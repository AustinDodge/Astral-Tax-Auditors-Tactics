/// @description sAIModifyAttackScore(vunit,vscore)
/// @param vunit
/// @param vscore
/*ran in all AI scripts at the end to modify the score based on abilities of the unit
that is being attacked.
*/

var vunit,vscore;

vunit = argument0
vscore = argument1


//Diversion
if ds_list_find_value(vunit.abilitiesusedlist,46) = 1{
    vscore = 10000000
    }

return vscore;
