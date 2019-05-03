//oItemControl is made when an inventory action button is clocked
var vtile,vunit,vunit,gunit,i,vdepth,vuseditem,vgaveitem,vlist,vpos,vpath,vdorelationship,vcanselect,vcanclick;

vdorelationship = 0

cursorbounce += 1
if cursorbounce = sprite_get_number(spunitselectyellow){
    cursorbounce = 0
    }
vuseditem = 0//if one use of the item should be taken from the inventory
vgaveitem = 0//if the item was transferred from the inventory of one unit to another, or the map.
vtile = -1
vunit = -1
vcanclick = 0
if findingtarget = 1{//if locating a target unit or tile
    vdepth = 10000
    //get tile under cursor
    
    /*with oMapTile{
        if canitem = 1{//if the tile is in the item range
            if collision_point(imouse_x,imouse_y,id,0,0) > 0{//if the tile is under the cursor
                if depth < vdepth{//if it's at a lower depth
                    vtile = id
                    vdepth = depth
                    }
                }
            }
        }*/
    //get unit under cursor
    vdepth = 10000
    /*with oUnitParent{
        //can't use items on objects or items, except for KO units.
        vcanselect = 1
        if object_is_ancestor(object_index,oItemParent){
            vcanselect = 0
            }
        if object_is_ancestor(object_index,oEnvironmentObjectUnit){
            if object_index != oKOAuditor{
                vcanselect = 0
                }
            }
        //if !object_is_ancestor(object_index,oItemParent) and (!object_is_ancestor(object_index,oEnvironmentObjectUnit) and !object_index = oKOAuditor){//if it's not an item or object
        if vcanselect = 1{
            if mytile > 0{//if the unit has a tile
                if mytile.canitem = 1{//if that unit's tile is in the item range
                    if collision_point(imouse_x,imouse_y,id,0,0) > 0{//if the unit is under the cursor
                        if depth < vdepth{//if it's at a lower depth
                            vunit = id
                            vdepth = depth
                            }
                        }
                    }
                }
            }
        }*/
    
    /*if actionmode = 0 or actionmode = 2{//if using consumable or giving item
        if vunit > -1{
            if vunit.mytile > 0{
                vtile = vunit.mytile//we're selecting a unit, so the tile is the tile of the untit selected
                }
            }
        }else{//if using trap or discarding item
        if vtile > -1{
            if vtile.occupied > 0{
                gunit = vtile.occupied
                if !object_is_ancestor(gunit.object_index,oItemParent) and !object_is_ancestor(gunit.object_index,oEnvironmentObjectUnit){//if it's not an object
                    vunit = vtile.occupied//we're selecting a tile so link vunit to the selected tile
                    }
                }
            }
        }
    if actionmode = 2{//if the player is giving an item, don't allow the unit with the item to be selected
        if vunit = startunit{
            vunit = 0
            }
        }*/
        
    vtile = sGetTileUnderCursor()
    if vtile > 0{
        vunit = vtile.occupied
        }
    
    if vtile > 0{//draw the tile cursor and lines, set target tile
        if vtile.canitem = 1{
            if vtile != stile{
                stile = vtile
                sTileCursorSetPosition(stile)
                ptargettile = stile
                if actionmode = 1{//if using a trap item, draw the range
                    with oAttackRange{//now draw the range of the item, if applicable
                        instance_destroy()
                        }
                    with oMapTile{
                        canattack = 0
                        attackable = 0
                        }
                    sFindAttackRange(pitem,stile)
                    sMakeAttackRange(pitem.weaponhealing)
                    }
                }
           
            }else{//if there's nothing under the cursor, reset
            if stile != 0{
                stile = 0
                }
            ptargettile = 0
            }
        }
    ptargetunit = 0
    if vunit > 0{//set target unit to unit under cursor
        var vcanuse;
        vcanuse = 1
        /*if !object_is_ancestor(vunit.object_index,oItemParent) and !object_is_ancestor(vunit.object_index,oEnvironmentObjectUnit){
            ptargetunit = vunit
            }*/
        if object_is_ancestor(vunit.object_index,oItemParent){
            vcanuse = 0
            }
        if object_is_ancestor(vunit.object_index,oEnvironmentObjectUnit){
            if vunit.object_index != oKOAuditor{
                vcanuse = 0
                }
            }
        if vcanuse = 1{
            ptargetunit = vunit
            }
        }else{
        ptargetunit = 0
        }
    if mouse_check_button_pressed(mb_right){//if the player right clicks
        vpos = pitem.inventorypos
        var vx,vy,gx,gy;
        if actionmode = 0{//if the player is using a consumable
            if ptargetunit > 0{
                if ptargetunit = startunit{//if the item is being used on the unit who's inventory is being accessed
                    vuseditem = 1
                    vgaveitem = 0
                    with pitem{
                        sGetItemScript(itemtype)//use the item
                        }
                    itemdone = 1
                    }else{//if the item will be used on another unit
                    vuseditem = 1
                    startunit.facing = sUnitFaceUnit(startunit,ptargetunit)
                    
                    vx = pitem.x
                    vy = pitem.y
                    gx = ptargetunit.x
                    gy = ptargetunit.y-28
                    vpath = sItemMakeThrowPath(vx,vy,gx,gy)
                    with pitem{
                        mypath = vpath
                        path_start(vpath,3,path_action_stop,0)
                        }
                    pitem.startunit = startunit
                    pitem.target = ptargetunit
                    pitem.targetunit = ptargetunit
                    pitem.thrown = 1
                    //startunit.turnover = 1
                    //startunit.moved = 1
                    startunit.cancancelmove = 0
                    }
                }
            }//END ACTIONMODE 0: USING CONSUMABLE
        
        if actionmode = 1{//if the player is using a trap
            if ptargettile > 0{
                if ds_grid_get(mapitemgrid,ptargettile.mx,ptargettile.my) = -1{//for now, don't allow items to be thrown on other items
                    //in the future I'll allow it, but traps will destroy items already on the tile
                    vx = pitem.x
                    vy = pitem.y
                    gx = ptargettile.x
                    gy = ptargettile.y
                    vpath = sItemMakeThrowPath(vx,vy,gx,gy)
                    with pitem{
                        mypath = vpath
                        path_start(vpath,3,path_action_stop,0)
                        }
                    pitem.target = ptargettile
                    pitem.targettile = ptargettile
                    pitem.thrown = 1
                    vuseditem = 1
                    vgaveitem = 0
                    //startunit.turnover = 1
                    //startunit.moved = 1
                    startunit.cancancelmove = 0
                    startunit.movepoints = 0
                    //endunit = 1
                    if startunit.object_index = oAuditor{
                        if !instance_exists(oXPControl){//make XPControl to give experience to the unit using the trap
                            instance_create(x,y,oXPControl)
                            oXPControl.target = startunit
                            with oXPControl{
                                event_perform(ev_other,ev_user0)
                                }
                            }
                    vdorelationship = 1
                        }//end all checks
                    startunit.facing = sTileFaceTile(startunit.mytile,ptargettile)
                    }
                }
            }//END ACTIONMODE 1: USING TRAP
        if actionmode = 2{//if the player is giving an item to a unit
            if ptargetunit > 0{
                if ptargetunit != startunit{//don't let a unit give an item to themself
                    var cangive,canstore,canequip,storearmor,storeweapon,vtargettile,canget;
                    cangive = 0
                    canstore = 0
                    canequip = 
                    itemtype = 0
                    storearmor = 0
                    storeweapon = 0
                    vtargettile = ptargetunit.mytile
                    canget = 0
                    
                    if ds_list_size(ptargetunit.inventorylist) < ptargetunit.inventoryslots{
                        canstore = 1
						canget = 1
						itemtype = 0
                        }
                    /*
                    if pitem.itemisweapon = 1 or pitem.itemisarmor = 1{
                        if pitem.itemisweapon = 1{
                            itemtype = 1
                            canget = 1
                            if ptargetunit.myweapon > 0{
                                if canstore = 1{
                                    storeweapon = 1//targetunit will store its CURRENT weapon
                                    }
                                }
                            }
                        if pitem.itemisarmor = 1{
                            itemtype = 2
                            canget = 1
                            if ptargetunit.myarmor > 0{
                                if canstore = 1{
                                    storearmor = 1//targetunit will store the CURRENT armor
                                    }
                                }
                            }
                        }else{
                        itemtype = 0//trap or consumable
                        }
                    
                    if itemtype = 0 and canstore = 1{
                        canget = 1
                        }*/
                    
                    /*New behavior, all items can only be taken if there is room in inventory, nothing
					is equipped automatically*/
                    
                    if canget = 1{
                        startunit.cancancelmove = 0
                        startunit.movepoints = 0
                        pitem.explodable = 0
                        
                            
                        //find the target tile that any DISCARDED items of the TARGET unit will go to
                        /* the follwing is discarded, all items are treated identically
                        switch itemtype{
                            case 0://giving a trap/consumable
                                //sAddItemToInventory(ptargetunit,pitem.mydata)
                                ; break;
                            case 1://giving a weapon
                                if storeweapon = 1{
                                    //have the target unit store it's weapon
                                    sAddItemToInventory(ptargetunit,ptargetunit.myweaponlist)
                                    }else{
                                    sForceDiscardItem(ptargetunit,-1,0)
                                    }
                                ptargetunit.myweapon = -1
                                //ptargetunit.myweapon = pitem.itemtype
                                ; break;
                            case 2: //giving armor
                                if storearmor = 1{
                                    //have the target unit store its armor
                                    sAddItemToInventory(ptargetunit,ptargetunit.myarmorlist)
                                    }else{
                                    sForceDiscardItem(ptargetunit,-2,0)
                                    }
                                ptargetunit.myarmor = 0
                                //ptargetunit.myarmor = pitem.itemtype
                                ; break;
                            }
						*/
						
						//sAddItemToInventory(ptargetunit,pitem.mydata)
                            
                        vuseditem = 1
                        vgaveitem = 1
                        startunit.facing = sUnitFaceUnit(startunit,ptargetunit)
                        
                        vx = pitem.x
                        vy = pitem.y
                        gx = ptargetunit.x
                        gy = ptargetunit.y-28
                        vpath = sItemMakeThrowPath(vx,vy,gx,gy)
                        with pitem{
                            mypath = vpath
                            path_start(vpath,3,path_action_stop,0)
                            }
                        pitem.target = ptargetunit
                        pitem.targetunit = ptargetunit
                        pitem.thrown = 1
                        endunit = 1
                        //startunit.turnover = 1
                        //startunit.moved = 1
                        startunit.cancancelmove = 0
                        startunit.movepoints = 0
                        }else{//if the unit does not have free slots
                        show_message("Selected unit doesn't have room in their inventory!")
                        }
                    }
                }
            }//END ACTIONMODE 2: GIVING ITEM
            

        if actionmode = 3{//if the player is discarding an item
            if ptargettile > 0{
                if ds_grid_get(mapitemgrid,ptargettile.mx,ptargettile.my) = -1{
                    startunit.facing = sTileFaceTile(startunit.mytile,ptargettile)
                    vuseditem = 1
                    vgaveitem = 1
                    vx = pitem.x
                    vy = pitem.y
                    gx = ptargettile.x
                    gy = ptargettile.y-3
                    vpath = sItemMakeThrowPath(vx,vy,gx,gy)
                    with pitem{
                        mypath = vpath
                        path_start(vpath,3,path_action_stop,0)
                        }
                    pitem.target = ptargettile
                    pitem.targettile = ptargettile
                    pitem.thrown = 1
                    endunit = 1
                    //startunit.turnover = 1
                    //startunit.moved = 1
                    //startunit.cancancelmove = 0
                    }else{
                    show_message("There's already an item on that tile!")
                    vuseditem = 0
                    endunit = 1
                    }
                }
            }
        if vuseditem = 1{//if the item was used, remove it from startunit's inventory then destroy oItemControl
            instance_create(x,y,oActionControl)
            oActionControl.startunit = startunit
            oActionControl.relationshipunit = startunit
            oActionControl.endunitwhendone = 1
            if vdorelationship = 1{
                sRelationshipAddProximity(startunit)
                }
            sDestroyRangeTiles()
            if vgaveitem = 1{//if the item is removed from the inventory
                if pitem.mydata = startunit.myweaponlist{//was in weapon slot
                    startunit.myweapon = 0
                    startunit.myweaponlist = -1
                    with startunit{
                        sGetWeaponStats(myweapon)
                        }
                    }
                if vpos = -2{
                    startunit.myarmor = 1
                    startunit.myarmorlist = -1
                    with startunit{
                        sGetArmorStats(myarmor)
                        }
                    }
                if vpos >= 0{
                    sRemoveItemFromInventory(startunit,vpos)
                    }
                }else{//if the unit used an item without removing it from their inventory
                var vlist,vuses;
                if vpos >= 0{
                    vlist = ds_list_find_value(startunit.inventorylist,vpos)
                    }
                if vpos = -1{//if it was in a weapon slot{
                    vlist = startunit.myweaponlist
                    }
                if vpos = -2{
                    vlist = startunit.myarmorlist
                    }
                vuses = ds_list_find_value(vlist,1)
                //if vuses is a negative number, that means the item has unlimited uses.
                if vuses > 0{
                    vuses -= 1
                    //update the uses, delete the item if it's out of uses.
                    if vuses > 0{
                        ds_list_replace(vlist,1,vuses)
                        }else{
                        sDestroyHeldItem(startunit,vlist,2)
                        }
                    }//end checking number of uses
                }//end vgaveitem check
            with oInventoryButton{
                instance_destroy()
                }
            sMakeInventoryButtons(startunit)
            findingtarget = 0
            //startunit.turnover = 1
            //startunit.moved = 1
            startunit.cancancelmove = 0
            startunit.movepoints = 0
            
            }//end vuseditem check
        }//end right mouse check
    if mouse_check_button_pressed(mb_left){//if the left button is clicked
        sDestroyRangeTiles()
        pitem.explodable = 0
        with pitem{
            instance_destroy()
            }
        startunit.anim = 1
        sClickOnPlayerUnit(startunit)
        canclick = 1
        instance_destroy()
        }//end left button
        
    }//end findingtarget check
    
if itemdone = 1{
    startunit.didaction = 1
    if inelevator = 1{
        endunit = 0
        
        }
    if ptargetunit != startunit{//manually switch startunit's animation if necessary
        if endanim = 1{
            startunit.anim = 1
            }
        }
    if endunit = 1{
            startunit.turnover = 1
            startunit.moved = 1
            startunit.movepoints = 0
            //startunit.pmovepoints = 0
            startunit.cancancelmove = 0
        }
    instance_destroy()
    }






/* */
/*  */
