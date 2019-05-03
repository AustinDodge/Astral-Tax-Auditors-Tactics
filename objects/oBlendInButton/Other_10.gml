ds_list_replace(myunit.abilitiesusedlist,47,1)//unit is using Blend In
ds_list_replace(myunit.abilitiescooldownlist,47,3)//cooldown to two
sDestroyRangeTiles()
sUnitEndTurnAction(myunit,0)
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
