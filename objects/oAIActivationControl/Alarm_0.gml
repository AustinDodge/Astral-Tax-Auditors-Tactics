if ds_exists(mylist,ds_type_list){
    if ds_list_size(mylist) > 0{
        currentunit = ds_list_find_value(mylist,0)
        ds_list_delete(mylist,0)
        loopstep += 1//move to the next unit if available
        }else{
        //show_message("alarm0 done activating AI units!")
        ds_list_destroy(mylist)
        canmovecamera = 1
        canclick = 1
        instance_destroy()
        }
    }else{
    //show_message("oAIActivationControl doesn't have a list! That can't be good")
    canmovecamera = 1
    canclick = 1
    instance_destroy()
    }
    


