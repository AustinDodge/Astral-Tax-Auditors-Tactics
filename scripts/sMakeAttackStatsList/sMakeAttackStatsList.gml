/// @description sMakeAttackStatsList(attacker,defender)
/// @param attacker
/// @param defender
/*This script returns a ds_list containing all the attack determinations. It assumes that
the unit "attacker" can make an attack from its current position.
0 attackerhit
1 attackerdamage
2 attackercrit
3 attackerknock
*/

var vlist,vattacker,vdefender,vhit,vdamage,vcrit,vknock,skipstats;
vattacker = argument0
vdefender = argument1
vlist = ds_list_create()


vhit = sFindAttackHitChance(vattacker,vattacker.mytile,vdefender,1)
if vdefender.unitisobject = 1{
    vhit[0] = 100
    }
if vdefender.unitisitem = 1{
    vhit[0] = 100
    }
if ds_list_find_value(vdefender.abilitiesusedlist,54) = 1{//can't hit if unit has Adrenaline
    vhit[0] = 0
    }
if ds_list_find_value(vdefender.abilitiesusedlist,53) = 1{//can't hit if unit has Reflexes
    vhit[0] = 0
    }

vdamage = sFindAttackDamage(vattacker,vattacker.mytile,vdefender,1)//return the array, the value will be parsed later
vcrit = sFindAttackCritChance(vattacker,vattacker.mytile,vdefender)
//if a knock isn't possible, return -1, otherwise return the actual number.
vknock = -1
if vattacker.knockdist > 0{
    if sIsKnockPossible(vdefender,sUnitFaceUnit(vattacker,vdefender)){
        vknock = sFindAttackKnockChance(vattacker,vattacker.mytile,vdefender)
        }
    }

ds_list_add(vlist,vhit,vdamage,vcrit,vknock)
return vlist;

