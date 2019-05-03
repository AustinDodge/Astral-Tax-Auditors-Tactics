attacker.didaction = 1
attacker.attacked = 1

instance_create(x,y,oActionControl)
oActionControl.startunit = attacker
oActionControl.relationshipunit = attacker//default
var vendit;
vendit = 1//if the attacking unit's turn should end after attacking
if ds_list_find_value(attacker.abilitieslist,29) = 1{//if the unit has the Sneaky ability
    if attacker.movepoints > 0{//and it hasn't already moved
        vendit = 0
        }
    }
if vendit = 1{
    oActionControl.endunitwhendone = 1
    }
if vendit = 0{
    oActionControl.clickunitwhendone = 1
    oActionControl.endunitwhendone = 0
    }

sSpecialAttackStartAttack(attacker,defender,100,0,100,0,0,1)

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
instance_destroy()

