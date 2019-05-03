var weaponorarmor,unequipcurrent,vthing,vpos,vdata;


vthing = myitem.itemtype
vdata = myitem.mydata
vpos = myitem.inventorypos

if sGetItemInfo(myitem.itemtype,4) = 2{
    weaponorarmor = 0
    }else{//if storing armor
    weaponorarmor = 1
    }
unequipcurrent = 0
if weaponorarmor = 0{
    if myunit.myweapon != 0{
        unequipcurrent = 1
        }
    }else{
    if myunit.myarmor != 0{
        unequipcurrent = 1
        }
    }
    
//sRemoveItemFromInventory(myunit,inventorypos)

/*if unequipcurrent = 1{
    switch weaponorarmor{
        case 0: sAddItemToInventory(myunit,myunit.myweaponlist); myunit.myweapon = 0; myunit.myweaponlist = -1; break;
        case 1: sAddItemToInventory(myunit,myunit.myarmorlist); myunit.myarmor = 0; myunit.myarmorlist = -1; break;
        }
    }*/

switch weaponorarmor{
    case 0: myunit.myweaponlist = myitem.mydata; myunit.myweapon = myitem.itemtype; break;
    case 1: myunit.myarmorlist = myitem.mydata; myunit.myarmor = myitem.itemtype; break;
    }
with myunit{
    switch weaponorarmor{
        case 0: sGetWeaponStats(myweapon); break;
        case 1: sGetArmorStats(myarmor); break;
        }
    }


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

/* */
/*  */
