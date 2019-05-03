/// @description sGrenadeScript()
/*This script is run by an item when that item is used.
*/

var vstandin,vunit;

//vunit = targetunit//the unit that these effects will happen to

explodable = 1//prime the grenade to explode
alarm[8] = 20
mx = targettile.mx
my = targettile.my
depth = targettile.depth-6

vstandin = instance_create(x,y,oUseItemStandIn)
vstandin.sprite_index = sprite_index
vstandin.image_index = 1
vstandin.depth = depth
vstandin.visible = 0
vstandin.alarm[0] = 20


