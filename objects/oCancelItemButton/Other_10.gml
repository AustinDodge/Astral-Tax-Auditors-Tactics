/*with oUseConsumableItemButton{
    instance_destroy()
    }
with oUseTrapItemButton{
    instance_destroy()
    }
with oDiscardItemButton{
    instance_destroy()
    }
with oGiveItemButton{
    instance_destroy()
    }
with oStoreEquippedItemButton{
    instance_destroy()
    }*/
with myitem{
    explodable = 0
    instance_destroy()
    }
with myunit{
    anim = 1
    walkstep = 0
    }
    
sDestroyRangeTiles()
canclick = 1
sClickOnPlayerUnit(myunit)
with oInventoryInteractButton{
    instance_destroy()
    }

/* */
/*  */
