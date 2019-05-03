if animatingtransition = 1{//step event for the transition between turns
    if ds_list_empty(elevatorlist){//if there are no more elevators animating,
        elevatorsdone = 1
        }
    if elevatorsdone = 1{//check conditions necessary to start next turn
        transitiondone = 1
        }
    if transitiondone = 1{
        animatingtransition = 0
        if playerturn = 1{//if we're starting the playerturn
            canclick = 1
            }
        if playerturn = 2{//if we're starting the AI turn
            instance_create(x,y,oAIControl)
            }
        }
    }
    
if willchangeplayer = 1{
    if !instance_exists(oActionControl){
        if !instance_exists(oAIActivationControl){
            willchangeplayer = 0
            sPlayerChangePlayer()
            }
        }
    }

