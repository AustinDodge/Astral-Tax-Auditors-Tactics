/// @description sAttackControlAttackAnimStep(special)
/// @param special
/*This script is ran during the animation stage of oAttackControl while a unit is attacking.
*/

var vunit,vwinduptime,vstriketime,vdefender,vlist,i,cunit,vobj,vicon,vtraveltime,j,jlist,vspecial,vshove;

vspecial = argument0//if this is the regular attack or a "special" attack, called by oSpecialAttackControl instead of oAttackControl
vshove = 0
if vspecial = 1{
    vshove = shove
    }

if animating = 1{//only if attackcontrol is ready
    vunit = attacker
    vwinduptime = awinduptime
    vstriketime = astriketime
    if instance_exists(vunit){
        if animationstep < vwinduptime{//if the windup is happening
            vunit.anim = 2//draw attack animation
            vunit.animstep = 0//animation frame is 0
            if animationstep = 0{//on the first step of the animation
                if vunit.weaponwindupsound != -1 and vshove = 0{
                    //audio_play_sound(vunit.weaponwindupsound,2,0)
                    sSoundPlayEffect(vunit.weaponwindupsound,1,0,1)
                    }
                }
            }
        if animationstep = vwinduptime{//on the step where the windup turns to the strike
            if vshove = 0{
                if vunit.weaponwindupsound != -1{
                    audio_stop_sound(vunit.weaponwindupsound)
                    }
                if vunit.weaponstrikesound != -1{
                    //audio_play_sound(vunit.weaponstrikesound,2,0)
                    sSoundPlayEffect(vunit.weaponstrikesound,1,0,1)
                    }
                }else{//if the unit is shoving
                //audio_play_sound(soundWindupSwing1,2,0)
                sSoundPlayEffect(soundWindupSwing1,1,0,1)
                sUnitSetShudder(vunit,1)
                }
            jlist = ds_list_create()
            for(i = 0; i < ds_list_size(defenderlist); i += 1){
                vdefender = ds_list_find_value(defenderlist,i)
                if vdefender.unitisobject = 0{
                    if vunit.weaponhealing = 0{
                        vdefender.facing = sUnitFaceUnit(vdefender,vunit)//have the defender face the attacker
                        }//but not if it's getting healed!
                    }
                //do this on this single step for both the attacker and the defender, if valid
                //sAttackControlAttackHit()
                if vshove = 0{
                    ds_list_add(jlist,sAttackMakeParticle(vunit,vdefender))
                    }
                }
            //now find the highest particle travel time
            j = 0
            for (i = 0; i < ds_list_size(jlist); i += 1){
                if ds_list_find_value(jlist,i) > j{
                    j = ds_list_find_value(jlist,i)
                    }
                }
            ds_list_destroy(jlist)
            particletraveltime = j
            }
        }else{
        animationstep = vwinduptime+vstriketime
        }
    
    if animationstep >= vwinduptime{//if animation is past windup
        if instance_exists(vunit){
            vunit.anim = 2
            vunit.animstep = 1//strike animation frame
            if animationstep = vwinduptime+particletraveltime{
                for(i = 0; i < ds_list_size(defenderlist); i += 1){
                    vdefender = ds_list_find_value(defenderlist,i)
                    sAttackControlAttackHit(vunit,vdefender,vspecial)
                    }
                }
            
            if animationstep >= vstriketime+vwinduptime+particletraveltime{//after attacker is done striking
                /*if vshove = 0{
                    attacker.anim = 1//reset attacking unit to idle animation
                    }else{
                    attacker.alarm[6] = 20//set alarm to reset animation if shoving
                    }*/
                attacker.anim = 1//reset attacking unit to idle animation
                animating = 0//done animating, allowing to move back to the init step when completed
                }
            }else{//if the unit no longer exists, for example if it destroys itself when attacking
            animating = 0
            }
        }//end animation windup stage

    animationstep += 1//increase the animstep 1
    //}else{
    }
if animating = 0{
    //if done animating, go back to attackstep 0
    if vspecial = 0{
        if !instance_exists(oKnockControl) and !instance_exists(oDrawAttackHP) and animdone = 0{
            alarm[0] = 1
            animdone = 1
            }
        }else{
        //special attack
        if !instance_exists(oDrawAttackHP){
            animdone = 1
            alarm[0] = 1
            }
        }
    }
