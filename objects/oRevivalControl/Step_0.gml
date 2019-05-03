if instance_exists(myunit){
    myunit.anim = 6
    if !instance_exists(oDrawHealHP){
        myunit.anim = 0
        myunit.turnover = 1
        myunit.cancancelmove = 0
        instance_destroy()
        }
    }else{
    instance_destroy()
    }

