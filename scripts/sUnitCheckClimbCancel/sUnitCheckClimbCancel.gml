/// @description sUnitCheckClimbCancel(vunit)
/// @param vunit
/*If a unit has an ability that aids the mobility of another unit, it can't cancel its
move if it has helped another unit move. This script checks if the unit is on any other
unit's climbedonlist, and if so, returns 0, signifying that the unit cannot cancel its
move.*/

var vunit,i;
vunit = argument0


i = 1
with oUnitParent{
    if ds_list_find_index(climbedonlist,vunit) >= 0{
        i = 0
        }
    }
    
return i;
