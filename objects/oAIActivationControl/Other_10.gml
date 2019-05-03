if ds_list_size(mylist) > 0{
    active = 1
    loopstep = 1
    currentunit = ds_list_find_value(mylist,0)
    canmovecamera = 0
    oCamera.xborder = xborder
    oCamera.yborder = yborder
    ds_list_delete(mylist,0)
    //show_message("Need to activate AI units")
    }else{
    ds_list_destroy(mylist)
    instance_destroy()
    }

