var vdata;

if ds_list_size(myunit.inventorylist) < myunit.inventoryslots{
    /*with oUseConsumableItemButton{
        instance_destroy()
        }
    with oUseTrapItemButton{
        instance_destroy()
        }
    with oGiveItemButton{
        instance_destroy()
        }
    with oCancelItemButton{
        instance_destroy()
        }
    with oDiscardItemButton{
        instance_destroy()
        }*/
    
    
    if sGetItemInfo(myitem.itemtype,4) = 2{
        myunit.myweapon = 0
        vdata = myunit.myweaponlist
        vunit.myweaponlist = -1
        with myunit{
            sGetWeaponStats(myweapon)
            }
        }else{//if storing armor
        myunit.myarmor = 0
        vdata = myunit.myarmorlist
        vunit.myarmorlist = -1
        with myunit{
            sGetWeaponStats(myarmor)
            }
        }
    sAddItemToInventory(myunit,vdata)
    
    sUnitAnimTakeItem(myunit,myitem.itemtype)
    
    with myitem{//init myitem
        explodable = 0
        instance_destroy()
        }
    with oInventoryButton{
        instance_destroy()
        }
    sMakeInventoryButtons(myunit)
    
    sDestroyRangeTiles()
    //canclick = 1
    //sClickOnPlayerUnit(myunit)
    
    with oInventoryInteractButton{
        instance_destroy()
        }
    }

/* */
/*  */
