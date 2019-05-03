/// @description sAttackControlAttackHit(attacker,defender,special)
/// @param attacker
/// @param defender
/// @param special
/*This script is ran by oAttackControl when an attack hits. Previously this code was in the
step event, but it needed to be repeated twice and it was hard to track changes across
the repeats - this makes it uniform between the two events and clarifies the code.
*/
var vattacker,vdefender,cunit,vobj,vicon,vdidattackerhit,aattackerdamage,vattackerdamage,vdidattackerknock,
vlist,vhit,vdamage,vcrit,vknock,vroll,vspecial,vshove;

/*if attackermove = 1{
    vattacker = attacker
    vdefender = defender
    vdidattackerhit = didattackerhit
    vattackerdamage = attackerdamage
    vdidattackerknock = didattackerknock
    }else{
    vattacker = defender
    vdefender = attacker
    vdidattackerhit = diddefenderhit
    vattackerdamage = defenderdamage
    vdidattackerknock = diddefenderknock
    }*/
    
vattacker = argument0
vdefender = argument1
vspecial = argument2//if this is a "special" attack, called by oSpecialAttackControl
vshove = 0
if vspecial = 1{
    if shove = 1{
        vshove = 1
        }
    }

vlist = sMakeAttackStatsList(vattacker,vdefender)
vhit = ds_list_find_value(vlist,0)
aattackerdamage = ds_list_find_value(vlist,1)
vattackerdamage = aattackerdamage[0]

vcrit = ds_list_find_value(vlist,2)
vknock = ds_list_find_value(vlist,3)


ds_list_destroy(vlist)

if vspecial = 1{
    if oSpecialAttackControl.adam != -1{
        vattackerdamage = oSpecialAttackControl.adam
        }
    if oSpecialAttackControl.ahit != -1{
        vhit = oSpecialAttackControl.ahit
        }
    if oSpecialAttackControl.aknock != -1{
        vknock = oSpecialAttackControl.aknock
        }
    if oSpecialAttackControl.acrit != -1{
        vcrit = oSpecialAttackControl.acrit
        }
    }

vdidattackerhit = 0
vdidattackerknock = 0
vdidattackercrit = 0

//vroll = sRollHundred()
//if vroll < vhit{
//    vdidattackerhit = 1
//   }
vdidattackerhit = ds_map_find_value(hitmap,vdefender)
if vdidattackerhit = undefined{
    vdidattackerhit = 0
    show_message("ERROR: there was no entry in hitmap for the attacked unit!")
    }
    
vroll = sRollHundred()
if vroll < vknock{
    vdidattackerknock = 1
    }

vroll = sRollHundred()
if vroll < vcrit{
    vdidattackercrit = 1
    vattackerdamage *= 3
    instance_create(vdefender.x,vdefender.y,oCritIcon)
    }

    
vloseuse = 0
vammoorblunt = sGetItemInfo(vattacker.myweapon,6)
if vammoorblunt = 0{//ammo weapons always lose a use on attack
    vloseuse = 1
    }
if vdidattackerhit = 1{
    //set startunit for explosion purposes
    if vdefender.explodable = 1 or vdefender.explodestatus = 1{
        vdefender.startunit = vattacker
        }
    if vammoorblunt = 1{//blunted weapons only lose a use on a hit
        vloseuse = 1
        }
    if vattacker.weaponhealing = 0{
        vdefender.anim = 4//make the defender recoil
        //audio_play_sound(soundHit1,2,0)
        sSoundPlayEffect(soundHit1,1,0,1)
        }
    if vshove = 0{
        sAttackMakeHitParticle(vattacker,vdefender)
        sFindAttackStatusEffects(vattacker,vdefender)
        //check if defending unit received a status that would prevent it from countering
        //only on attacker turn
        if attackermove = 1{
            if vdefender.stunnedstatus > 0{
                candefenderattack = 0
                }
            }
        }
    //end attacker move
    
    if vattacker.chainattacks > 0 and vshove = 0{//if the vattacker will do a chain attack
        vicon = 0
        if vattacker.damagetype = 1{//energy damage
            vicon = oShockIcon
            }
        vlist = sFindAttackChainUnits(vattacker.chainattacks,vattacker,vdefender)
        for(i = 0; i < ds_list_size(vlist); i += 1){
            cunit = ds_list_find_value(vlist,i)
            if cunit != vdefender{
                cunit.anim = 4
                if vattacker.weaponhealing = 0{
                    sDrawUnitAttackHP(cunit,vattackerdamage)
                    }else{
                    sDrawUnitHealHP(vunit,vattackerdamage)
                    }
                //the icon here is just for visual effect
                if vicon != 0{
                    vobj = instance_create(cunit.x,cunit.y,vicon)
                    vobj.depth = cunit.depth-1
                    }
                sFindAttackStatusEffects(vattacker,cunit)
                }
            }
        if vicon != 0{
            vobj = instance_create(vdefender.x,vdefender.y,vicon)
            vobj.depth = vdefender.depth-1
            }
        ds_list_destroy(vlist)
        }//end chain attacks
    if vdidattackerknock = 1{//if the vattacker knocked the unit
        sAttackUnitStartKnock(vdefender,vattacker)
        if vshove = 0{
            vdefender.knockdamage += vattackerdamage
            }
        }else{//if no knock, make the unit shudder
        //on the attacker turn, it it will kill the unit, make sure it can't counter-attack
        if attackermove = 1{
            if vattackerdamage >= vdefender.hp{
                candefenderattack = 0
                }
            }
        if vattacker.weaponhealing = 0{
            sDrawUnitAttackHP(vdefender,vattackerdamage)
            }else{
            sDrawUnitHealHP(vdefender,vattackerdamage)
            }
        
        }
    }else{//if the unit missed
    if vattacker.explodestatus = 0{
        //if the unit doesn't explode on attack, 
        instance_create(vdefender.x,vdefender.y,oMissedIcon)
        }else{//if the attacker will blow up
        //explodestatus = 1
        vattacker.explodable = 1
        //only run this on the attacker turn
        if attackermove = 1{
            candefenderattack = 0//don't let the defender attack when it's blown up
            }
        //end attacker turn
        sDrawUnitAttackHP(vattacker,vattacker.hp)
        }
        
    }
    
if ds_list_find_value(vdefender.abilitiesusedlist,54) = 1{//if the unit has Adrenaline
    ds_list_replace(vdefender.abilitiesusedlist,54,0)
    sDrawAbilityUsed(54,vdefender.x,vdefender.y)
    }
if ds_list_find_value(vdefender.abilitiesusedlist,53) = 1{//if the unit is using Reflexes
    ds_list_replace(vdefender.abilitiesusedlist,53,0)
    sDrawAbilityUsed(53,vdefender.x,vdefender.y)
    }
    
//remove one use from the attacker's weapon if the conditions are met
if vloseuse = 1{
    vuses = ds_list_find_value(vattacker.myweaponlist,1)
    if vuses > 0{//if it's negative, that means it doesn't degrade
        vuses -= 1
        }
    if vuses < 0{
        vuses = 0
        }
    ds_list_replace(vattacker.myweaponlist,1,vuses)
    }
