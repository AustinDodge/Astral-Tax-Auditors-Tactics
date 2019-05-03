//CONFIRM button clicked

var vitem,vobj,vstandin;

/*cantakeit is set to either 1 or 2 in event0, depending on if the unit needs to drop the current item to take the new
one, or has nothing equipped and can immediately take the item.
*/

with cancel{
	instance_destroy()
	}
with confirm{
	instance_destroy()
	}

if cantakeit = 1{//if the unit can take the thing
    with mycontainer{
        vobj = sGetItemInfo(iteminside,3)//get the object index for the proper item
        vitem = instance_create(x,y,vobj)
        vitem.itemtype = iteminside
        vitem.depth = depth+1
        vitem.x = x
        vitem.y = y
        vitem.mx = mx
        vitem.my = my
        vitem.mytile = ds_grid_get(tilegrid,mx,my)
        vitem.mydata = sMakeItemData(iteminside,-1)
        //ds_grid_set(mapitemgrid,mx,my,vitem)
        with vitem{//init item to get attack stats if applicable item will init after it's thrown
            event_perform(ev_other,ev_user0)
            }
            
        disappearing = 1
        }
    //make itemcontrol and have it throw the item at the unit
    instance_create(x,y,oItemControl)
    oItemControl.startunit = mycontainer.mytile
    oItemControl.pitem = vitem
    oItemControl.findingtarget = 0
    oItemControl.actionmode = 2
    oItemControl.ptargetunit = myunit
    with oItemControl{
        event_perform(ev_other,ev_user1)
        }
    }

    with oItemPurchaseButton{
        instance_destroy()
        }
    with oVendorWindow{
        instance_destroy()
        }
    clickmode = 1
    //sClickOnPlayerUnit(myunit)
    instance_destroy()

/* */
/*  */
