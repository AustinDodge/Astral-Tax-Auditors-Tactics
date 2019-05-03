/// @description sFindAttackHitChance(attacker,attackertile,defender,returntooltip)
/// @param attacker
/// @param attackertile
/// @param defender
/// @param returntooltip
/*this script determines what the hit chance will be in combat between two units. The tile
the attacker unit attacks from can be changed so this can be used to predict the result of
moving to a different tile.

If returntooltip is one, script returns an array where 0 is the hit chance and 1 is the tooltip string
*/
var hit,aunit,atile,defunit,ediff,epercent,vbonus,vhalf,fbonus,vhit,vfriend,vmod,vstring,varray,vdotip;
aunit = argument0
atile = argument1
defunit = argument2
vdotip = argument3
vstring = ""

hit = aunit.skill
vhalf = floor(hit/2)
if vhalf <= 0{
    vhalf = 1
    }
vstring += "Base Hit "+string(hit)



if atile.elevation > defunit.elevation{//elevation bonus
    if ds_list_find_value(defunit.abilitieslist,31) = 0{//no height advantage if defender has Bottom Dweller
        ediff = atile.elevation - defunit.elevation
        epercent = .20*ediff    
        vhit = aunit.skill*epercent
		vstring += "\nElevation Bonus +"+string(aunit.skill*epercent)
        if ds_list_find_value(aunit.abilitieslist,20) = 1{//double bonus for High Ground ability
            vhit *= 2
			vstring += "\nx2 High Ground ability"
            }
        hit += vhit
        }
    }
    
//get weapn type bonuses and penalties
vbonus = sGetWeaponTypeBonus(aunit,defunit)
if vbonus = 1{
    vhit = vhalf
	vstring += "\nWeapon Type Bonus +"+string(vhalf)
    if ds_list_find_value(aunit.abilitieslist,21) = 1{
        vhit *= 2//double bonus for Specialist ability
		vstring += "\nSpecialist Ability +"+vhalf
		}
    hit += vhit
    }
if vbonus = 2{
    vhit = vhalf
	vstring += "\nWeapon Type Penalty -"+string(vhalf)
    if ds_list_find_value(defunit.abilitieslist,21) = 1{
        vhit *= 2//double penalty for Specialist ability
		vstring += "\nSpecialist Ability -"+string(vhalf)
        }
    hit -=  vhit
    }
fbonus = sGetFacingCombatBonus(aunit,defunit)
if fbonus = 2{//rear attack gets full bonus
    vhit = vhalf
	vstring += "\nRear Attack: "+string(vhit)
    if ds_list_find_value(aunit.abilitieslist,32) = 1{
        vhit *= 2//double bonus for Backstabber ability
		vstring += "\nx2 Backstabber Ability"
        }
    hit += vhalf
    }
if fbonus = 1{//side attack gets half bonus
    hit += floor(vhalf/2)
	vstring += "\nSide Attack: "+string(floor(vhalf/2))
    }
hit += aunit.accuracybonus
if aunit.accuracybonus > 0{
	vstring += "\nWeapon Accuracy Bonus: "+string(aunit.accuracybonus)
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
        hit += ceil(hit*vmod)
		vstring += "\nNearby Friends +"+string(ceil(hit*vmod))
        }
    }
//Diversion defensive bonus
/*if ds_list_find_value(defunit.abilitiesusedlist,46) = 1{
    hit -= 30
    }*/

    
hit = floor(hit)
if hit < 0{
    hit = 0
    }
if defunit.unitisobject = 1{//if it's an object,
    hit = 100
	vstring = "Stationary Object: 100"
    }
if vdotip = 1{
	varray[0] = hit
	varray[1] = vstring
	return varray;
	}else{
	varray[0] = hit
	varray[1] = ""
	return varray;
	}
