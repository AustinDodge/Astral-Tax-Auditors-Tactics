ds_list_replace(myunit.abilitiesusedlist,46,1)//unit is using Diversion
ds_list_replace(myunit.abilitiescooldownlist,46,1)//cooldown to 0
sDestroyRangeTiles()
//sUnitEndTurnAction(myunit,0)
//sUnitSetJump(myunit,3)
myunit.amdistracting = 1
with oButton{
    instance_destroy()
    }
sunit = myunit
/*
instance_create(x,y,oKongControl)
oKongControl.myunit = myunit
oKongControl.myobject = parent
with oKongControl{
    event_perform(ev_other,ev_user0)
    }

/*with myunit{
    cancancelmove = 0
    }
with mycontainer{
    opening = 1
    }
    
sUnitFaceUnit(myunit,mycontainer)
    


instance_create(x,y,oContainerWindow)
oContainerWindow.myunit = myunit
oContainerWindow.mycontainer = mycontainer
sDestroyRangeTiles()

with oContainerWindow{
    event_perform(ev_other,ev_user0)
    }
    

/* */
/*  */
