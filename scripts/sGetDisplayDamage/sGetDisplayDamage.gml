/// @description sGetDisplayAttack(unit)
/// @param unit
/*this script returns the base damage that a unit will do with an attack. It accounts
for any innate bonuses - those that aren't detemined by elevation, facing, etc.
*/

var vunit,vdam,vpercent;
vunit = argument0

vdam = vunit.attackstrength
if vunit.damagescaleswith > 0{
    if vunit.damagescaleswith = 1{//if the attack adds unit strength
        vdam += vunit.strength
        }
    if vunit.damagescaleswith = 2{//if the attack adds unit skill
        math_set_epsilon(0.0000)
        vpercent = floor((vdam/100)*vunit.skill)//add it as a percent of base damage
        math_set_epsilon(0.00)
        vdam += vpercent
        }
    }

return vdam;
