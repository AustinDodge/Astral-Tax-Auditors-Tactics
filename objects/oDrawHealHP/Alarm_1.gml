
if instance_exists(myunit){
    myunit.hp = actualhitpoints
    if myunit.hp > myunit.maxhp{
        myunit.hp = myunit.maxhp
        }
    
    if myunit.hp <= 0{
        with myunit{
            instance_destroy()
            }
        }else{
        myunit.anim = 1//reset the unit to walking
        }
    }
if !instance_exists(oAttackControl) and !instance_exists(oKnockControl) and !instance_exists(oAIControl){
    canclick = 1
    }

instance_destroy()

