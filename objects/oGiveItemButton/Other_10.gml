/*with oUseConsumableItemButton{
    instance_destroy()
    }
with oUseTrapItemButton{
    instance_destroy()
    }
with oDiscardItemButton{
    instance_destroy()
    }
with oCancelItemButton{
    instance_destroy()
    }
with oStoreEquippedItemButton{
    instance_destroy()
    }*/
with myitem{//init myitem
    event_perform(ev_other,ev_user0)
    }
instance_create(x,y,oItemControl)
oItemControl.actionmode = 2
oItemControl.startunit = myunit
oItemControl.pitem = myitem
with oInventoryInteractButton{
    instance_destroy()
    }

/* */
/*  */
