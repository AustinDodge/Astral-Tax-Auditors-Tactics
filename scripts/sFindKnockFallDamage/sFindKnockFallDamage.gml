/// @description sFindKnockFallDamage(fallheight,downrange)
/// @param fallheight
/// @param downrange
/*This script is used to determine the extra damage a unit will take from being knocked
off a ledge. Currently it multiplies the distance falled, minus the distance the unit can
traverse, by three, but this may change in the future.
*/
var vdist,drange,multiplier,dam;

vdist = argument0
drange = argument1

multiplier = 3

dam = (vdist-drange) * multiplier

return dam;
