var vkillit;
if instance_exists(myunit){
    //myunit.hp -= damage
	myunit.hp = actualhitpoints
    if myunit.hp <= 0{//check if the unit has Hard to Kill
        if (myunit.mytile).object_index != oPitTile{
            if ds_list_find_value(myunit.abilitieslist,27) = 1{
                if ds_list_find_value(myunit.abilitiesusedlist,27) = 0{
                    ds_list_replace(myunit.abilitiesusedlist,27,1)
                    vkillit = 0
                    myunit.hp = 1
                    sDrawAbilityUsed(27,myunit.x,myunit.y)
                    }
                }
            }
        }else{
        //other HP dependant abilities
        if ds_list_find_value(myunit.abilitieslist,24){//Rage
            if myunit.hp < myunit.maxhp/4{
                sDrawAbilityUsed(24,myunit.x,myunit.y)
                }
            }
        }
            
    if myunit.hp <= 0{
        vkillit = 1
        //check if Hard to Kill can be used
        
        if vkillit = 1{
            with myunit{
                //all objects except, right now, Auditors die when HP reaches 0.
                if object_index != oAuditor{
                    amidead = 1
                    }else{
                    if mytile.object_index != oPitTile{
                        amikod = 1
                        }else{
                        amidead = 1
                        }
                    }
                if instance_exists(oKillControl){
                    amidead = 1
                    }
                instance_destroy()
                }
            }
        if instance_exists(oAttackControl){
            if oAttackControl.animating = 1{
                with oAttackControl{
                    //animationstep = vwinduptime+vstriketime
                    }
                }
            }
        }else{
        if myunit.amknocked = 0{
            myunit.anim = 1//reset the unit to walking
            }
        }
    }
//if !instance_exists(oAttackControl) and !instance_exists(oKnockControl) and !instance_exists(oAIControl){
//    canclick = 1
//    }

instance_destroy()

