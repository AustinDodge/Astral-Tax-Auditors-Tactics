/// @description sFindAttackStatusEffects(attacker,defender)
/// @param attacker
/// @param defender
/*This script is called by oAttackControl in the step event during the attack itself.
When damage is inflicted, this script sees if a unit should get any status effects.
*/

var stunchance,explodechance,vattacker,vdefender,vnum,vturns;
vattacker = argument0
vdefender = argument1

stunchance = sGetWeaponStatusChance(vattacker.myweapon,0)
explodechance = sGetWeaponStatusChance(vattacker.myweapon,1)

//stun
if vdefender.unitisitem = 0 and vdefender.unitisobject = 0{
    if nosavescumming = 1{
        vnum = sGetPremadePercent()
        }else{
        vnum = irandom(99)
        }
    if vnum < stunchance{
        vturns = sGetWeaponStatusTurns(vattacker.myweapon,0)
        //vturns = 1//debug
        sUnitDrawStatus(vdefender,0,vturns)
        }
    
    //explode
    if nosavescumming = 1{
        vnum = sGetPremadePercent()
        }else{
        vnum = irandom(99)
        }
    if vnum < explodechance{
        vturns = sGetWeaponStatusTurns(vattacker.myweapon,1)
        //vturns = 1//debug
        sUnitDrawStatus(vdefender,0,vturns)
        }
    }
