/// @description sAttackControlInitAttack(special)
/// @param special
/*This script is ran before a unit has an attack round. It double-checks that a unit can attack
the unit it's trying to attack, and populates defenderlist with all units that will be affected
by the attack.
*/
var vattacker,vtarget,vcanhit,i,vunit,vstartunit,vnum,vspecial;
animdone = 0

vspecial = argument0//if it's a regular init of a "special" init

//if a unit on the same team can make an attack after the initial attack, add it to attacklist.
vstartunit = endturnunit
if vspecial = 0{
    //don't allow allies to attack on special attack
    if instance_exists(vstartunit){
        if howmanyloops > 0{
            with oUnitParent{
                if canmakefriends = 1{
                    if team = vstartunit.team{
                        vnum = sGetUnitRelationshipLevel(id,vstartunit,1)
                        if vnum >= 1{//if the units are base-level friends
                        vtarget = ds_map_find_value(oAttackControl.targetmap,vstartunit)
                            if instance_exists(vtarget){
                                if ds_list_find_index(oAttackControl.unitlist,id) < 0 and ds_list_find_index(oAttackControl.attackerlist,id) < 0{
                                    if sIsTileInAttackRange(vtarget.mytile,id){
                                        if sCheckLineOfSight(mytile,vtarget.mytile,id,vtarget){
                                            sAttackControlInjectUnit(id,vstartunit,0)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

if ds_list_size(attackerlist) > 0{
    vattacker = -3000
    //show_message(instance_exists(vattacker))
    while (instance_exists(vattacker) = 0 and ds_list_size(attackerlist) > 0){
        //make sure that the instance still exists, always potentially a problem when dealing with attacks
        vattacker = ds_list_find_value(attackerlist,0)
        ds_list_delete(attackerlist,0)
        if vattacker = undefined{
            vattacker = -3000
            }
        if !instance_exists(vattacker){
            vattacker = -3000
            }
        }
    vcanhit = 0
    if vattacker != undefined and vattacker > 0{
        //get the unit vattacker is attempting to target
        vtarget = -1000
        vtarget = ds_map_find_value(targetmap,vattacker)
        
        ds_list_clear(defenderlist)
        vcanhit = 0
        if instance_exists(vtarget){
            //show_message(vtarget.name)
            if sIsTileInAttackRange(vtarget.mytile,vattacker){
                vcanhit = 1
                }
            }
        if vattacker.stunnedstatus = 1{//can't attack when stunned
            vcanhit = 0
            }
        if vattacker.unitisobject = 1{//objects can't attack
            vcanhit = 0
            }
        if vattacker.unitisitem = 1{//items can't attack
            vcanhit = 0
            }
        }
    
    if vcanhit = 1{
        attacker = vattacker
        ds_list_add(defenderlist,vtarget)
        particletraveltime = 0//this will be updated in the animation step if necessary
        //add the unit making an attack to unitlist, unless it's already on it
        if ds_list_find_index(unitlist,vattacker) < 0{
            ds_list_add(unitlist,vattacker)
            }
        //add in other code for other units that need to defend later
        
        
        //now determine whether each unit hits or misses, and save that in hitmap.
        ds_map_clear(hitmap)
        var vsize,vhit,vhitchancevroll,vlist;
        vsize = ds_list_size(defenderlist)
        for(i = 0; i < vsize; i += 1){
            vunit = ds_list_find_value(defenderlist,i)
            if vunit.aiactivated = 0{
                vunit.aiactivated = 1
                sUnitMakeLightSource(vunit,10,40)
                }
            vlist = sMakeAttackStatsList(vattacker,vunit)
            vhitchance = ds_list_find_value(vlist,0)
            if vspecial = 1{
                vhitchance = ahit
                }
            vroll = sRollHundred()
            vhit = 0
            if vroll < vhitchance{
                vhit = 1
                }
            ds_map_add(hitmap,vunit,vhit)
            ds_list_destroy(vlist)
            }
        vattacker.facing = sUnitFaceUnit(vattacker,vunit)
        animationstep = 0
        animating = 1
        attackstep += 1
        howmanyloops += 1
        }else{
        sAttackControlInitAttack(vspecial)
        }
    //if the unit cannot attack its target, it's deleted from attackerlist and this init event will
    //repeated with the next unit on attackerlist until attackerlist is empty.
    }else{
    finished = 1
    //with every unit that had an attack, check if its weapon was used up, and if so, destroy it
    var vuses;
    for(i = 0; i < ds_list_size(unitlist); i += 1){
        vunit = ds_list_find_value(unitlist,i)
        if instance_exists(vunit){
            vuses = ds_list_find_value(vunit.myweaponlist,1)
            if vuses = 0{
                sDestroyHeldItem(vunit,vunit.myweaponlist,0)
                }
            }
        }
    //end the initiating unit's turn
    if endturnunit > 0{
        if instance_exists(endturnunit){
            endturnunit.attacked = 1
            if endturnunit.turnover = 0{
                if !instance_exists(oActionControl){//oActionControl will take care of this itself
                    if playerturn = 1{//on the player turn
                        //sMakeUnitFacingArrow(endturnunit,0)
                        var vend;
                        vend = 1
                        if ds_list_find_value(endturnunit.abilitieslist,29) = 1{//if the unit has the Sneaky ability
                            if endturnunit.movepoints > 0{
                                vend = 0
                                }
                            }                        
                        if vend = 1{
                            sUnitEndTurnAction(endturnunit,1)
                            }else{
                            sClickOnPlayerUnit(endturnunit)
                            }
                        }else{
                        endturnunit.turnover = 1
                        endturnunit.movepoints = 0
                        }
                    }
                }
            }
        }
    clickmode = 0
    instance_destroy()
    }






























