if ds_exists(relationshiplist,ds_type_list){
    ds_list_destroy(relationshiplist)
    }
//all units reset one-use-per-action abilities
with oUnitParent{
    ds_list_replace(abilitiesusedlist,7,0)//rebound
    if unitisitem = 0{
        startunit = 0//reset startunit, used for explosion damage calculations
        }
    }
if inelevator{
    oElevatorInterstitialControl.actionsused += 1
    }

