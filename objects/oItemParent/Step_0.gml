with (oItemParent) {
if thrown = 1{
    if path_position >= 0.5{
        depth = target.depth-1
        }
    if path_position >= 0.99{
        
        if mycontrol > 0{
            if mycontrol.actionmode = 0{//if use,
                sGetItemScript(itemtype)//use the item when it hits the unit
                }
            if mycontrol.actionmode = 1{//if use trap,
                mytile = targettile
                sGetItemScript(itemtype)//use the trap when it hits the tile
                }
            if mycontrol.actionmode = 2{//if giving the item,
                var vstandin;
                
                if itemdestination = -1{
					sAddItemToInventory(targetunit,mydata)
                    if itemisweapon = 0 and itemisarmor = 0{//if it's a regular item
                        //ds_list_add(targetunit.inventorylist,mydata)
                        //sAddItemToInventory(targetunit,mydata)
                        }else{
						
                        if itemisweapon = 1{
                            targetunit.myweapon = itemtype
                            targetunit.myweaponlist = mydata
                            with targetunit{
                                sGetWeaponStats(myweapon)
                                }
                            }
                        if itemisarmor = 1{
                            targetunit.myarmor = itemtype
                            targetunit.myarmorlist = mydata
                            }
                        }
                    }else{//if the item's destination has been pre-determined
					sAddItemToInventory(targetunuit,mydata)
                    switch itemdestination{
                        case 0: ;break;//sAddItemToInventory(targetunit,mydata); break;//inventory
                        case 1://weapon
                            targetunit.myweapon = itemtype
                            targetunit.myweaponlist = mydata
                            with targetunit{
                                sGetWeaponStats(myweapon)
                                }
                            ; break;
                        case 2://armor
                            tartetunit.myarmor = itemtype
                            targetunit.myarmorlist = mydata
                            ; break;
                        }
                    }//end pre-determined item destination
                
                vstandin = instance_create(x,y,oUseItemStandIn)
                vstandin.sprite_index = sprite_index
                vstandin.image_index = 1
                vstandin.depth = depth
                vstandin.myanimtarget = targetunit
                vstandin.fadeout = 1
                targetunit.anim = 6
                explodable = 0
                instance_destroy()
                }
            if mycontrol.actionmode = 3{//if discarding the item
                mytile = targettile
                mx = mytile.mx
                my = mytile.my
                ds_grid_set(mapitemgrid,mx,my,id)
                if initialized = 0{
                    event_perform(ev_other,ev_user0)//init the item for map use
                    }
                }
            mycontrol.itemdone = 1//destroy mycontrol
            thrown = 0
            }else{
            //assume the item is being discarded if there's no itemcontrol
            thrown = 0
            mytile = targettile
            mx = mytile.mx
            my = mytile.my
            ds_grid_set(mapitemgrid,mx,my,id)
            if initialized = 0{
                event_perform(ev_other,ev_user0)//init the item for map use
                }
            }
        path_delete(mypath)
        }
    }






















}
