/// @description sMakeUnitInMap(instance,tile,levelup)
/// @param instance
/// @param tile
/// @param levelup
/*This script takes a unit that has been created in a script outside of the map creation
event and performs all necessary init events for the unit. The unit itself needs to be made,
and a tile needs to be picked for it. This script takes care of the rest. If levelup = 1
then the unit will level up from 0 to the unit's level.
*/

var vunit,vtile,vlevelup,vlevel;
vunit = argument0
vtile = argument1
vlevelup = argument2

with vunit{
    event_perform(ev_other,ev_user0)
    }
if vlevelup = 1{
    vlevel = 0
    while vlevel < vunit.tlevel{
        with vunit{
            event_perform(ev_other,ev_user1)
            vlevel += 1
            }
        }
    }

vunit.x = vtile.x
vunit.y = vtile.y
vunit.depth = vtile.depth-5
vunit.mx = vtile.mx
vunit.my = vtile.my
vunit.mytile = vtile
vunit.nexttile = vtile
vunit.elevation = vtile.elevation
vtile.occupied = vunit
ds_grid_set(unitposgrid,vunit.mx,vunit.my,vunit)
vunit.initialized = 1
with vunit{
    sGetWeaponStats(myweapon)
    }
