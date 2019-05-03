
var vunit,vlist,wlist,wunit,i;
if alldone = 1{
    //check if there are units around the start unit taht need to be activated
    vlist = ds_list_create()
    if startunit > 0 and instance_exists(startunit){
        if startunit.team = 1{//if it's a player unit
            vunit = startunit
            with oUnitParent{
                if team != 1{
                    if aiactivated = 0{
                        if ds_grid_get(myinfluencemap,vunit.mx,vunit.my) = 1{
                            //what to do if there are any units that need to be activated
                            ds_list_add(vlist,id)
                            }
                        }
                    }
                }
            }
        }else{//if there's no startunit
        if playerturn = 1{
            wlist = ds_list_create()
            with oUnitParent{
                if team = 1{
                    ds_list_add(wlist,id)
                    }
                }
            if ds_list_size(wlist) > 0{
                while ds_list_size(wlist) > 0{
                    wunit = ds_list_find_value(wlist,0)
                    ds_list_delete(wlist,0)
                    with oUnitParent{
                        if team != 1{
                            if aiactivated = 0{
                                if ds_grid_get(myinfluencemap,wunit.mx,wunit.my) = 1{
                                    ds_list_add(vlist,id)
                                    }
                                }
                            }
                        }
                    }
                ds_list_destroy(wlist)
                }
            }
        }//end making list of units to activate
        
    //now loop through the list, making sure there are no duplicates
    if ds_list_size(vlist) > 0{
        var glist,dunit,vpos;
        glist = ds_list_create()
        for (i = 0; i < ds_list_size(vlist); i += 1){
            dunit = ds_list_find_value(vlist,i)
            vpos = ds_list_find_index(glist,dunit)
            //Units are added to glist after they're checked here. If a unit is already on the glist,
            //that means it's a duplicate and can be deleted.
            if vpos >= 0{
                ds_list_delete(vlist,vpos)
                i -= 1
                }
            ds_list_add(glist,dunit)
            }
        ds_list_destroy(glist)
        }
    //make sure the list still has anything on it
    if ds_list_size(vlist) > 0{//if there are any units that need to be activated
        if !instance_exists(oAIActivationControl){
            instance_create(x,y,oAIActivationControl)
            oAIActivationControl.mylist = vlist
            with oAIActivationControl{
                event_perform(ev_other,ev_user0)
                }
            event_perform(ev_other,ev_user0)
            }else{
            //if oAIActivationControl already exists somehow, add the new units to its existing list
            var j;
            while ds_list_size(vlist) > 0{
                j = ds_list_find_value(vlist,0)
                if ds_list_find_index(oAIActivationControl.mylist,j) = -1{
                    ds_list_add(oAIActivationControl.mylist,j)
                    }
                ds_list_delete(vlist,0)
                }
            ds_list_destroy(vlist)
            }
        }else{
        //if no units need to be activated, destroy
        ds_list_destroy(vlist)
        event_perform(ev_other,ev_user0)
        }
    /*if clickunitwhendone = 1{
        clickunitwhendone = 0
        if instance_exists(clickunit){
            if object_is_ancestor(clickunit.object_index,oUnitParent){
                sClickOnPlayerUnit(clickunit)
                }
            }
        }*/
    //event_perform(ev_other,ev_user0)//destroy oActionControl and return control to the player
    }

/* */
/*  */
