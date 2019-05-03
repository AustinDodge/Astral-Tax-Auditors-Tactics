if activated = 1{
    if !instance_exists(oDrawAttackHP){
        alarm[0] = 10
        activated = 0
        }
    }
with oUnitParent{
    if alarm[4] >= 0{
        alarm[4] = 20
        }
    }

