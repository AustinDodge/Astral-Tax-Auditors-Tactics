

var vcanclick;
vcanclick = 1//if the player should be able to click after finish
if alldone = 1{

    if startunit > 0{
        //never end a unit's turn when in the elevator tram
        if inelevator = 1{
            endunitwhendone = 0
            }
        if instance_exists(startunit){
            //begin correction for Taste for Combat ability
            if unitkilled = 1{//if a unit was killed during the action
                if ds_list_find_value(startunit.abilitieslist,28) = 1{//if the unit has Taste for Combay
                    if endunitwhendone = 1{
                        endunitwhendone = 0
                        clickunitwhendone = 1
                        }
                    }
                if ds_list_find_value(startunit.abilitieslist,54) = 1{//if the unit has Adrenaline
                    ds_list_replace(startunit.abilitiesusedlist,54,1)//use Adrenaline
                    }
                }
            if endunitwhendone = 1{
                if playerturn = 1{
                    //startunit.turnover = 1
                    //instance_create(startunit.x,startunit.y-20,oUnitFacingArrow)
                    //oUnitFacingArrow.myunit = startunit
                    sMakeUnitFacingArrow(startunit,0)
                    vcanclick = 0
                    startunit.cancancelmove = 0
                    
                    }else{
                    startunit.turnover = 1
                    startunit.cancancelmove = 0
                    }
                }
            if clickunitwhendone = 1{
                sClickOnPlayerUnit(startunit)
                clickunitwhendone = 0
                }
            }
        }
        
    if instance_exists(oAIControl){
        oAIControl.movingaunit = 2
        }else{
        if !instance_exists(oAIActivationControl){
            if vcanclick = 1{
                canclick = 1
                }
            alldone = 1
            }
        }
    instance_destroy()
    //show_message("Destroying oActionControl")
    }

