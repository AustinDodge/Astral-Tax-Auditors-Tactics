if active = 1{
    switch loopstep{
    case 1://move the camera to the next unit
        if (abs(currentunit.x - oCamera.x) > xborder) or (abs(currentunit.y - oCamera.y) > yborder){
            oCamera.cameratargeting = 1
            oCamera.targetx = currentunit.x
            oCamera.targety = currentunit.y
            }
        loopstep += 1
        ; break;
    case 2://activate current unit
        if oCamera.cameratargeting = 0{//if the camera has finished moving to, or is already at, the next unit
            alarm[0] = atime
            currentunit.aiactivated = 1
            currentunit.turnover = 0
            var vexc,vface,vunit;
            vunit = instance_nearest(currentunit.x,currentunit.y,oAuditor)
            if vunit > 0{
                vface = sUnitFaceUnit(currentunit,vunit)
                currentunit.facing = vface
                }
            vexc = instance_create(currentunit.x,currentunit.y-20,oIntRedExclamation)
            vexc.depth = currentunit.depth-1
            vexc.alarm[0] = atime
            sUnitMakeLightSource(currentunit,10,40)
            loopstep = 0
            }
        ; break;
        }
    }
                

