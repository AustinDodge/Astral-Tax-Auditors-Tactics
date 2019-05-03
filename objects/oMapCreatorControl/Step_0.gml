canclick = 0
var maxsteps;

with oMapControl{
    if inelevator = 0{//make a map
        maxsteps = sMapMakeRoom(makestep)
        makestep += 1
        }else{//make an elevator room
        maxsteps = sMapMakeElevatorInterstitial(makestep)
        makestep += 1
        }
    }
makestep = oMapControl.makestep
    
if makestep > maxsteps{
    canclick = 1
    instance_destroy()
    }

