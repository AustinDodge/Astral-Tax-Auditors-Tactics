alldone = 0

if !instance_exists(oKnockControl) and !instance_exists(oKillControl){
    noknock = 1
    }else{
    noknock = 0
    }
if !instance_exists(oAttackControl) and !instance_exists(oSpecialAttackControl){
    noattack = 1
    }else{
    noattack = 0
    }    
if !instance_exists(oDrawAttackHP) and !instance_exists(oDrawHealHP){
    nohp = 1
    }else{
    nohp = 0
    }
if !instance_exists(oItemControl) and !instance_exists(oUseItemStandIn){
    noitem = 1
    }else{
    noitem = 0
    }
if !instance_exists(oXPControl){
    noxp = 1
    }else{
    noxp = 0
    }
if !instance_exists(oRelationshipControl){
    norelate = 1
    }else{
    norelate = 0
    }

//check for abilities that rely on oActionControl   
noability = 1
if instance_exists(oFirstAidControl){
    noability = 0
    }

noelevatoranimating = 1
if instance_exists(oElevatorTile){
    with oElevatorTile{
        if animating = 1{
            oActionControl.noelevatoranimating = 0
            }
        }
    }
if noknock = 1{
    if noxp = 1{
        if noitem = 1{
            if noelevatoranimating = 1{
                if noattack = 1{
                    if nohp = 1{
                        //do relationship stuff before checking if there is no relationshipcontrol
                        if dorelationships = 1{
                            if ds_exists(relationshiplist,ds_type_list){
                                if ds_list_size(relationshiplist) > 0{
                                    instance_create(x,y,oRelationshipControl)
                                    oRelationshipControl.relationshiplist = relationshiplist
                                    oRelationshipControl.startunit = relationshipunit
                                    with oRelationshipControl{
                                        event_perform(ev_other,ev_user0)
                                        }
                                    norelate = 0
                                    }
                                }
                            dorelationships = 0//don't attempt to do this each time
                            }
                        if norelate = 1{
                            if noability = 1{
                                //show_message("Good to go!")
                                //if instance_exists(oAIControl){
                                    //oAIControl.movingaunit = 2
                                    //}else{
                                    //canclick = 1
                                    //alldone = 1
                                    //}
                                //instance_destroy()
                                alldone = 1
                                if alarm[0] < 0{
                                    if !instance_exists(oAIControl){
                                        alarm[0] = 2
                                        }else{
                                        alarm[0] = 5//a slightly longer alarm to allow for AI
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

