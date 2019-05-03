instance_create(x,y,oAttackControl)

attacker.didaction = 1

attacker.attacked = 1

oAttackControl.endturnunit = attacker
ds_list_add(oAttackControl.attackerlist,attacker)
ds_map_add(oAttackControl.targetmap,attacker,defender)
ds_map_add(oAttackControl.targetmap,defender,attacker)//add the map entry even if the unit won't counter, so it can inject other units in who can
if candefenderattack{
    ds_list_add(oAttackControl.attackerlist,defender)
    }


sDestroyRangeTiles()
with oButton{
    instance_destroy()
    }
with oAttackControl{
    event_perform(ev_other,ev_user0)
    }
if attackerknocklist >= 0{
    ds_list_destroy(attackerknocklist)
    }
if defenderknocklist >= 0{
    ds_list_destroy(defenderknocklist)
    }
    
instance_create(x,y,oActionControl)
oActionControl.startunit = attacker
oActionControl.relationshipunit = attacker//default
var vendit;
vendit = 1//if the attacking unit's turn should end after attacking
if ds_list_find_value(attacker.abilitieslist,29) = 1{//if the unit has the Sneaky ability
    if attacker.movepoints > 0{//and it hasn't already moved
        vendit = 0
        }
    }else{//if the unit doesn't have the Sneaky ability
    attacker.movepoints = 0//count the unit as having moved after attacking
    attacker.cancancelmove = 0
    }
attacker.cancancelmove = 0
attacker.prevtile = attacker.mytile
attacker.pmovepoints = attacker.movepoints
if vendit = 1{
    oActionControl.endunitwhendone = 1
    }
if vendit = 0{
    oActionControl.clickunitwhendone = 1
    oActionControl.endunitwhendone = 0
    }
//determine if units will gain friendships
if attacker.team = 1{
    if attacker.canmakefriends = 1{
        var vlist;
        //make the list of nearby units to add relationships to
        vlist = sRelationshipMakeFriendsList(attacker)
        if ds_list_size(vlist) > 0{
            oActionControl.dorelationships = 1
            oActionControl.relationshiplist = vlist
            oActionControl.relationshipunit = attacker
            }else{
            ds_list_destroy(vlist)
            }
        }
    }/*else{
    if defender.team = 1{
        if defender.canmakefriends = 1{
            var vlist;
            vlist = sRelationshipMakeFriendsList(defender)
            if ds_list_size(vlist) > 0{
                oActionControl.dorelationships = 1
                oActionControl.relationshiplist = vlist
                oActionControl.relationshipunit = defender
                }else{
                ds_list_destroy(vlist)
                }
            }
        }
    }*/


if attacker.object_index = oAuditor{//if attacker is on player team
    if !instance_exists(oXPControl){
        instance_create(x,y,oXPControl)
        oXPControl.target = attacker
        with oXPControl{
            event_perform(ev_other,ev_user0)
            }
        }else{
        show_message("oXPControl already exists, that's weird you should check that out")
        }
    }else{
    if defender.object_index = oAuditor{
        if !instance_exists(oXPControl){
            instance_create(x,y,oXPControl)
            oXPControl.target = defender
            with oXPControl{
                event_perform(ev_other,ev_user0)
                }
            }else{
            show_message("oXPControl already exists, that's weird you should check that out")
            }
        }
    }


with cancel{//destroy everything else
    instance_destroy()
    }
with confirm{
    instance_destroy()
    }
with shove{
    instance_destroy()
    }
sMakeInventoryButtons(attacker)
instance_destroy()

/* */
/*  */
