/// @description sDrawAbilityUsed(abilitynum,x,y)
/// @param abilitynum
/// @param x
/// @param y
/*When a ability modifies the outcome of something, this will draw that ability icon at the
place it was used. For example: when an explosion is more powerful because the unit has
the Demolitions Expert ability, draw this with the explosion.
*/

var abilitynum,vx,vy,vicon,vability;

abilitynum = argument0
vx = argument1
vy = argument2

vicon = sAbilityFindIcon(abilitynum)

vability = instance_create(vx,vy,oAbilityUsedIcon)
vability.sprite_index = vicon
vability.depth = -9999

