/// @description sPickUpGroundItem()
/*called by oPickUpItemButton user0 event.
*/

var canget,canstore,canequip,itemtype,willequip,storearmor,storeweapon;

/*When a unit picks up a consumable or trap, it checks if there's room in the unit's inventory
and stores it if it can. If the unit is attempting to pick up armor or a weapon, the unit will
automatically equip it. If it already has a weapon or armor equipped, it will put the weapon/armor
in storage if there's room, otherwise it will drop the currently equipped weapon/armor.
*/

itemtype = 0//0 is item, 1 is weapon, 2 is armor
canget = 0
willequip = 0//if the unit will equip the armor or weapons underneath them, or store it.
canstore = 0
canequip = 0
storeweapon = 0//if the unit will store the currently equipped weapon/armor
storearmor = 0




//determine if the unit can store the current item in inventory
if ds_list_size(myunit.inventorylist) < myunit.inventoryslots{
    canstore = 1
    }

if myitem.itemisweapon = 1 or myitem.itemisarmor = 1{
    if myitem.itemisweapon = 1{
        itemtype = 1//weapon type
        canget = 1
        if myunit.myweapon > 0{
            if canstore = 1{
                storeweapon = 1//the unit will store the CURRENTLY EQUIPPED weapon
                }
            }
        }
    if myitem.itemisarmor = 1{
        itemtype = 2//armor type
        canget = 1
        if myunit.myarmor > 0{
            if canstore = 1{
                storearmor = 1//store the CURRENTLY EQUIPPED armor
                }
            }
        }
    }else{
    itemtype = 0//trap or consumable
    }
    
if itemtype = 0 and canstore = 1{
    canget = 1//can only take consumables/traps if there's room in inventory
    }


if canget = 1{//if the unit is able to pick up the item
    myunit.cancancelmove = 0
    myitem.explodable = 0
    /*switch itemtype{
        //case 0: ds_list_add(myunit.inventorylist,myitem.itemtype); break;
        case 0: sAddItemToInventory(myunit,myitem.itemtype); break;
        case 1: myunit.myweapon = myitem.itemtype; break;
        case 2: myunit.myarmor = myitem.itemtype; break;
        }*/
    ds_grid_set(mapitemgrid,myitem.mx,myitem.my,-1)
    switch itemtype{
        case 0://taking a consumable/trap
            sAddItemToInventory(myunit,myitem.mydata); 
            break;
        case 1://taking a weapon
            if storeweapon = 1{
                sAddItemToInventory(myunit,myunit.myweaponlist)
                }else{
                sForceDiscardItem(myunit,-1,0)
                }
            myunit.myweapon = myitem.itemtype
            myunit.myweaponlist = myitem.mydata
            ; break;
        case 2://taking armor
            if storearmor = 1{
                sAddItemToInventory(myunit,myunit.myarmorlist)
                }else{
                sForceDiscardItem(myunit,-2,0)
                }
            myunit.myarmor = myitem.itemtype
            myunit.myarmorlist = myitem.mydata
            ; break;
        }
    
    vstandin = instance_create(myunit.x,myunit.y-28,oUseItemStandIn)
    vstandin.sprite_index = myitem.sprite_index
    vstandin.image_index = 1
    vstandin.depth = myunit.depth-1
    vstandin.fadeout = 1
    vstandin.myanimtarget = myunit
    myunit.anim = 6//set the unit to holding
    instance_create(x,y,oActionControl)
    canclick = 0
    
    sUnitAnimTakeItem(myunit,myitem.itemtype)
    with myitem{
        instance_destroy()
        }
    
    if itemtype = 1{//change weapon stats
        with myunit{
            sGetWeaponStats(myweapon)
            }
        }
    if itemtype = 2{
        with myunit{
            sGetArmorStats(myarmor)
            }
        }
    sClickOnPlayerUnit(myunit)
    }
