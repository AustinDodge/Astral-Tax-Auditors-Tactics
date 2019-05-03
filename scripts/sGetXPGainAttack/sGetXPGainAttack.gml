/// @description sGetXPGainAttack(attacker,defender,willkill)
/// @param attacker
/// @param defender
/// @param willkill
/*This script determines the XP that a unit will gain from attacking another unit.
willkill is if the units attack will kill the other unit. Currently XP starts at 50 for
a kill and 15 for an attack. For a kill, 10 xp is added for each level above the attacker
the defender is, and 10 is removed for each level below. For an attack, the same but 3 added
and removed.
*/
var aunit,defunit,willkill,vdiff,vbase,vadd,vxp;
aunit = argument0
defunit = argument1
willkill = argument2

vdiff = defunit.level - aunit.level
if willkill = 1{
    vbase = 50
    vadd = 10
    }else{
    vbase = 15
    vadd = 3
    }

vxp = vbase + (vadd*vdiff)

if defunit.explodestatus = 1{
    vxp = floor(vxp/3)
    }

if vxp <= 0{
    vxp = 1
    }
    

    
//vxp = 105//debug

return vxp;



