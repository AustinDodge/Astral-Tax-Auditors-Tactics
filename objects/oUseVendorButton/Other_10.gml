var vtile;

if canclick = 1{
    
    sUnitFaceUnit(myunit,myvendor)
    
    sDestroyRangeTiles()
    with oButton{
        instance_destroy()
        }
    
    
    instance_create(x,y,oVendorWindow)
    oVendorWindow.myunit = myunit
    oVendorWindow.myvendor = myvendor
    sDestroyRangeTiles()
    with oVendorWindow{
        event_perform(ev_other,ev_user0)
        }
        
    sMakeInventoryButtons(myunit)
    canclick = 0
   
    }

