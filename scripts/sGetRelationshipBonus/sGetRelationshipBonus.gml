/// @description sGetRelationshipBonus(vunit)
/// @param vunit
/*Returns the maximum relationship bonus available to a unit from its current position
*/

var vunit,vlevel,i,vdist,gdist;

vunit = argument0
vlevel = 0
i = -1
vdist = 2//the proximity to another unit that allows for a relationship bonus

with oUnitParent{
    if team = vunit.team{
        gdist = vdist//allow for an ability modifier letting units get a bonus from further away
        if abs(mx-vunit.mx)+abs(my-vunit.my) <= gdist{
            vlevel = sGetUnitRelationshipLevel(vunit,id,1)
            if vlevel > i{
                i = vlevel
                }
            }
        }
    }

return i;
