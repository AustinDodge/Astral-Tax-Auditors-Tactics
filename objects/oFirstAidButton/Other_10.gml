sDestroyRangeTiles()
instance_create(x,y,oFirstAidControl)
oFirstAidControl.startunit = myunit
with oFirstAidControl{
    event_perform(ev_other,ev_user0)
    }
with oButton{
    instance_destroy()
    }
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
