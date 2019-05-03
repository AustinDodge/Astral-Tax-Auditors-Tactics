/// @description sUnitAnimTakeItem(unit,itemtype)
/// @param unit
/// @param itemtype
/*This script makes the animation of a unit taking an item happen - it changes the unit's
animation, creates the standin, turns canclick to 0, and creates oActionControl. It just
does the animation, it doesn't change any data.
*/
var vstandin,vtype,vunit,vsprite;

vunit = argument0
vtype = argument1

vsprite = sGetItemInfo(vtype,2)

vstandin = instance_create(vunit.x,vunit.y-28,oUseItemStandIn)
vstandin.sprite_index = vsprite
vstandin.image_index = 1
vstandin.depth = vunit.depth-1
vstandin.fadeout = 1
vstandin.myanimtarget = vunit
vunit.anim = 6//set the unit to holding
instance_create(x,y,oActionControl)
oActionControl.startunit = vunit
oActionControl.clickunitwhendone = 1
canclick = 0
