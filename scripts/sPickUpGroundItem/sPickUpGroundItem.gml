/// @description sPickUpGroundItem()
/*called by oPickUpItemButton user0 event.
*/

var canget,canstore,canequip,itemtype,willequip,storearmor,storeweapon;

/*When a unit picks up a consumable or trap, check if there is room in the current inventory.
If there isn't don't pick up the item. When picking an item up, don't make a distinction
between item types.
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

if canstore = 1{
    canget = 1
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
    sClickOnPlayerUnit(myunit)
    }
