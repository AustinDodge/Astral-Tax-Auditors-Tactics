if canbeclicked = 1{
    var vdest,vitem;
    
    vdest = 0//where the item will go - 0 is inventory, 1 is equipped weapon, 2 is equipped armor
    //Weapon and armor will always be equipped immediately if the unit has nothing equipped
    //otherwise they'll go into inventory
    if itemtype = 2{
        //if it's a weapon
        if myunit.myweapon <= 0{
            vdest = 1
            }
        }
    if itemtype = 3{
        if myunit.myarmor <= 0{
            vdest = 2
            }
        }
    //now we know if the item will go into the unit's inventory, weapon, or armor slot. Put it there.
    vobj = sGetItemInfo(itemnumber,3)//get the object index for the proper item
    vitem = instance_create(myvendor.x,myvendor.y,vobj)
    vitem.itemtype = itemnumber
    vitem.depth = (myvendor.depth)+1
    vitem.x = myvendor.x
    vitem.y = myvendor.y
    vitem.mx = myvendor.mx
    vitem.my = myvendor.my
    vitem.itemdestination = vdest
    vitem.mytile = ds_grid_get(tilegrid,myvendor.mx,myvendor.my)
    vitem.mydata = sMakeItemData(itemnumber,-1)
    //ds_grid_set(mapitemgrid,mx,my,vitem)
    with vitem{//init item to get attack stats if applicable item will init after it's thrown
        event_perform(ev_other,ev_user0)
        }
    
    instance_create(x,y,oItemControl)
    oItemControl.startunit = myunit
    //oItemControl.startunit = myunit
    oItemControl.pitem = vitem
    oItemControl.findingtarget = 0
    oItemControl.actionmode = 2
    oItemControl.ptargetunit = myunit
    with oItemControl{
        event_perform(ev_other,ev_user1)
        }
        
    with oVendorWindow{
        instance_destroy()
        }
        
    playermoney -= myprice//subtract money from player
    myunit.movepoints = 0
    myunit.cancancelmove = 0
    
    }






























