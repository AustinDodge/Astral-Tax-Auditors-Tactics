mywindow = instance_create(x,y,oUnitFacingArrowWindow)
mywindow.wname = myunit.name
mywindow.myunit = myunit
mywindow.cancancel = cancancel
with mywindow{
    event_perform(ev_other,ev_user0)
    }

