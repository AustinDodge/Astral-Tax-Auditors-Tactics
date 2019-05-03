/// @description sFindAttackCritChance(attacker,attackertile,defender)
/// @param attacker
/// @param attackertile
/// @param defender
/*this script determines what the crit chance will be in combat between two units. The tile 
the attacker unit attacks from can be changed so this can be used to predict the result of
moving to a different tile. It's just a placeholder for now and always returns 5
*/

var crit,aunit,atile,defunit,ediff,epercent,vbonus,vhalf,fbonus,vfriend,vmod;

aunit = argument0
atile = argument1
defunit = argument2

vbonus = sGetWeaponTypeBonus(aunit,defunit)
fbonus = sGetFacingCombatBonus(aunit,defunit)

crit = 5

vhalf = floor(crit/2)
if vhalf <= 0{
    vhalf = 1
    }



if vbonus = 1{
    crit += vhalf
    }
if vbonus = 2{
    crit -= vhalf
    }

if fbonus = 2{//front attack gets full bonus
    crit += vhalf
    }
if fbonus = 1{//side attack gets half bonus
    crit += floor(vhalf/2)
    }
    
//friendship bonus
if aunit.canmakefriends = 1{
    vfriend = sGetRelationshipBonus(aunit)
    if vfriend > 0{
        vmod = vfriend/10
        if ds_list_find_value(aunit.abilitieslist,38) = 1{//extrovert, smaller bonus
            vmod = vfriend/15
            }
        if ds_list_find_value(aunit.abilitieslist,39) = 1{//introvers,greater bonus
            vmod = vfriend/5
            }
        crit += (crit*vmod)
        }
    }
crit = floor(crit)
if crit < 0{
    crit = 0
    }

return crit;
