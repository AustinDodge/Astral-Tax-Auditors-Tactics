if tallydone = 0{//oXPControl gets input from every enemy that has damage done to it during the attack
    if !instance_exists(oKnockControl){
        noknock = 1
        }else{
        noknock = 0
        }
    if !instance_exists(oAttackControl){
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
    /*if !instance_exists(oRelationshipControl){
        norelate = 1
        }else{
        norelate = 0
        }*/
    noactions = 0
    if noknock = 1{
        if noitem = 1{
            if noattack = 1{
                if nohp = 1{
                    noactions = 1
                    //show_message("Good to go!")
                    if alarmset = 0{
                        alarmset = 1
                        alarm[0] = 2//set the alarm, re-check if noactions = 1when the alarm goes off
                        }
                    }
                }
            }
        }
    }

/* */
/*  */
