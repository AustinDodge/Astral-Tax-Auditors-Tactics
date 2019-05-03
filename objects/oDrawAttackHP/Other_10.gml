if instance_exists(myunit){
    maxhitpoints = myunit.maxhp
    starthitpoints = myunit.hp
    actualhitpoints = starthitpoints - damage
    if actualhitpoints < 0{
        actualhitpoints = 0//correct so it doesn't take too long to count down
        }
    greenpoints = starthitpoints
    hpdifference = damage
    redpoints = 0
    alarm[0] = 20
    //myunit.hp -= damage

    
    if myunit.unitisitem = 0 and myunit.unitisobject = 0{//if it's an actual unit, not an object or item
        var wk,vxp,vtarget;
        wk = 0
        if actualhitpoints <= 0{
            wk = 1
            }
        if instance_exists(oXPControl){
            vtarget = oXPControl.target
            if instance_exists(vtarget){
                if myunit.team != vtarget.team{//no experience for damaging your own units!
                    vxp = sGetXPGainAttack(oXPControl.target,myunit,wk)
                    //oXPControl.targetxpgain += vxp
                    sUnitGainXP(vxp)
                    }
                }
            }
        }
    }else{
    instance_destroy()
    }

