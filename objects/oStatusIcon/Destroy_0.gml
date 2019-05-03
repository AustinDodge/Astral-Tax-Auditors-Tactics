ds_list_destroy(statuslist)
if instance_exists(myunit){
    myunit.mystatus = 0
    if myunit.showstunnedstatus = 1{
        show_message("Destroying status icon while unit is still stunned!")
        }
    if myunit.showexplodestatus = 1{
        show_message("Destroying status icon while unit is still explodey!")
        }
    }

