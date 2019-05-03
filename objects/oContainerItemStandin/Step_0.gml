if fadeout = 1{
    y += 1
    if y >= targety{
        var vitem,vobj;
        vobj = sGetItemInfo(mytype,3)//get the object index for the proper item
        vitem = instance_create(x,y,vobj)
        vitem.itemtype = mytype
        vitem.depth = depth+1
        vitem.x = x
        vitem.y = y
        vitem.mx = mx
        vitem.my = my
        vitem.mytile = ds_grid_get(tilegrid,mx,my)
        vitem.mydata = mydata
        ds_grid_set(mapitemgrid,mx,my,vitem)
        with vitem{//init item to get attack stats if applicable
            event_perform(ev_other,ev_user0)
            }
        instance_destroy()
        }
    }

