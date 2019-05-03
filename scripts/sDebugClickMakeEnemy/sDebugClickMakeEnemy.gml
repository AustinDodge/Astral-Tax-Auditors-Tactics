/// @description sDebugClickMakeEnemy(vtile)
/// @param vtile
/*this script creates an enemy on the (presumably empty) tile that the user crtl-clicks
on.
*/

var vtype,vobj,vunit,vlevel,vtile,j;
vtile = argument0
vtype = 1
vobj = sPickEnemy(vtype)
vunit = instance_create(x,y,vobj)
vlevel = 3//there will be something to actually pick the level in the future

with vunit{
    event_perform(ev_other,ev_user0)//perform init
    for (j = 0; j < vlevel; j += 1){//level up
        event_perform(ev_other,ev_user1)
        }
    
    }
vunit.x = vtile.x
vunit.y = vtile.y
vunit.depth = vtile.depth-5
vunit.mx = vtile.mx
vunit.my = vtile.my
vunit.mytile = vtile
vunit.elevation = vtile.elevation
vtile.occupied = vunit
ds_grid_set(unitposgrid,vunit.mx,vunit.my,vunit)
vunit.initialized = 1
with vunit{
    sGetWeaponStats(myweapon)
    }
