/// @description sFindAttackDamage(attacker,attackertile,defender,returntooltip)
/// @param attacker
/// @param attackertile
/// @param defender
/// @param returntooltip
/*this script determines what the damage will be in combat between two units. The tile the
attacker unit attacks from can be changed so this can be used to predict the result of
moving to a different tile.

If returntooltip is true, returns an array where 0 is the damage, and 1 is the tooltip string.
*/
var dam,aunit,atile,defunit,ediff,vpercent,vbonus,fbonus,vhalf,vdam,vfriend,vmod,vstring,varray,vdotip;
aunit = argument0
atile = argument1
defunit = argument2
vdotip = argument3
vstring = ""


dam = aunit.attackstrength
vstring += "Base Atk "+string(aunit.attackstrength)
if aunit.damagescaleswith > 0{
    switch aunit.damagescaleswith{
        case 1: //attack adds unit strength
    //if aunit.damagescaleswith = 1{//if the attack adds unit strength
            dam += aunit.strength; 
			vstring += "\nStrength +"+string(aunit.strength)			
			;break;
        //}
    //if aunit.damagescaleswith = 2{//if the attack adds unit skill
        case 2: //attack adds unit skill
            math_set_epsilon(0.0000)
            vpercent = floor((dam/100)*aunit.skill)//add it as a percent of base damage
            math_set_epsilon(0.00)
            dam += vpercent
			vstring += "\n+Skill Percent +"+string(vpercent)
            //dam += aunit.skill
            ; break;
            //}
        case 3: //attack adds unit intelligence
			dam += aunit.intelligence
			vstring += "\n+Add Int +"+string(aunit.intelligence)
            ; break;
        case 4: //attack multiplies unit intelligence
            dam *= aunit.intelligence
			vstring += "\nInt Multiply +"+string(aunit.intelligence)
            ; break;
        
        //end damage scaling
        }
    }
    
        
                
if aunit.weaponhealing = 0{//if the unit is healing, don't modify the strength.
    vhalf = floor(dam/2)//set attack bonus before any bonuses are calculated
    if vhalf <= 0{
        vhalf = 1
        }
    if atile.elevation > defunit.elevation{
        if ds_list_find_value(defunit.abilitieslist,31) = 0{//no bonus if the defending unit has Bottom Dweller
            ediff = atile.elevation - defunit.elevation
            epercent = .25*ediff//normal
            vdam = floor(aunit.attackstrength*epercent)
			vstring += "\nElevation Bonus +"+string(vdam)
            if ds_list_find_value(aunit.abilitieslist,20) = 1{//double bonus for High Ground ability
                vdam *= 2
				vstring += "\nx2 High Ground Ability"
                }
            dam += vdam
            }
        }
    
    vbonus = sGetWeaponTypeBonus(aunit,defunit)//get weapon bonus
    if vbonus = 1{
        vdam = vhalf
		vstring += "\nWeapon Type Bonus: +"+string(vdam)
        if ds_list_find_value(aunit.abilitieslist,21) = 1{//double bonus for Specialist ability
            vdam *= 2
			vstring += "\nxSpecialist Ability: +"+string(vdam)
            }
        dam += vdam
        }
    if vbonus = 2{
        vdam = vhalf
		vstring += "\nWeapon Type Penalty: -"+string(vdam)
        if ds_list_find_value(defunit.abilitieslist,21) = 1{//double penalty for Specialist
			vstring += "\nSpecialist Ability: -"+string(vdam)
            vdam *= 2
            }
        dam -= vdam
        }
    
    fbonus = sGetFacingCombatBonus(aunit,defunit)//get facing bonus
    if fbonus = 2{//rear attack gets full bonus
        vdam = vhalf
		vstring += "\nRear Attack: +"+string(vdam)
        if ds_list_find_value(aunit.abilitieslist,32) = 1{//backstabber
            vdam *= 2
			vstring += "\nx2 Backstabber Ability"
            }
        dam += vdam
        }
    if fbonus = 1{//side attack gets half bonus
        dam += floor(vhalf/2)
		vstring += "\nSide Attack +"+string(floor(vhalf/2))
        }
    }
if ds_list_find_value(aunit.abilitieslist,24) = 1{
    //if the unit has the Rage ability
    if aunit.hp < (aunit.maxhp/4){
        dam *= 2
		vstring += "\nTotal 2x for Rage Ability"
        }
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
        dam += ceil(dam*vmod)
		vstring += "\nNearby Friends +"+string(dam*vmod)
        }
    }
    
//Diversion defensive bonus
/*if ds_list_find_value(defunit.abilitiesusedlist,46) = 1{
    dam = dam/2//half damage
    if dam < 1{
        dam = 1
        }
    }*/


//finished calculating, correct to a whole number
dam = floor(dam)
if dam <= 0{
    dam = 0
    }
	
varray[0] = dam
varray[1] = vstring
//return dam;
if vdotip = 1{
	return varray;
	}else{
	return varray;
	}
