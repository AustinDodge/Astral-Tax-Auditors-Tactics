/// @description sStartElevatorAnimation()
/*this script is ran by oPlayerControl to move elevators in the up position down and
vice versa. It populates elevatorlist and starts all elevators moving.
*/
elevatorsdone = 0
with oElevatorTile{
    ds_list_add(oPlayerControl.elevatorlist,id)
    animating = 1
    donemoving = 0
    if elevation = lowelevation{//if down, go up
        goingup = 1
        }else{
        goingdown = 1
        }
    }
    
