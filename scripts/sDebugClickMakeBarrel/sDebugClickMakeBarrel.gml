/// @description sDebugClickMakeBarrel(vtile)
/// @param vtile
/*this script creates a barrel on the (presumably empty) tile that the user crtl-clicks
on.
*/

var vtype,vobj,vunit,vlevel,vtile,j;
vtile = argument0
vtype = 1
vobj = oGreenBarrel
vunit = instance_create(x,y,vobj)
vlevel = 3//there will be something to actually pick the level in the future


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
    event_perform(ev_other,ev_user0)
    }
