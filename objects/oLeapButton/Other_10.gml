ds_list_replace(myunit.abilitiesusedlist,41,1)//unit is using Leap
ds_list_replace(myunit.abilitiescooldownlist,41,2)//cooldown to two
with oButton{
    instance_destroy()
    }
sunit = myunit
sClickOnPlayerUnit(myunit)
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
