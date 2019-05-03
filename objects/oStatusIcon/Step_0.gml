if !instance_exists(myunit){
    instance_destroy()
    exit;
    }

x = myunit.x
y = myunit.y
depth = myunit.depth-1

//spindex += 0.1

//drawindex = floor(spindex)
//if drawindex >= 3{
//    changestatus = 1
//    spindex = 0
//    drawindex = 0
//    }

drawindex = oIconControl.statusindex
if ds_list_size(statuslist) > 0{
    if changestatus = 1{
        changestatus = 0
        statuspos += 1
        if statuspos >= ds_list_size(statuslist){
            statuspos = 0
            }
        var vstat,foundit,vstart,vpos,deleteit,turnsthrough;
        foundit = 0
        turnsthrough = 0
        while foundit = 0 and ds_list_size(statuslist) > 0{
            turnsthrough += 1
            if turnsthrough > 100{
                show_message("Infinite loop in turnsthrough!")
                show_message(ds_list_size(statuslist))
                }
            vstat = ds_list_find_value(statuslist,statuspos)
            foundit = 0
            deleteit = 0
            switch vstat{
                case 0: if myunit.showstunnedstatus = 0{
                    deleteit = 1
                    }
                    ; break;//stunned status
                case 1: if myunit.showexplodestatus = 0{
                    deleteit = 1
                    }
                    ; break;//boomy
                }//end switch
            if deleteit = 1{
                vpos = ds_list_find_index(statuslist,vstat)
                ds_list_delete(statuslist,vpos)
                if statuspos >= ds_list_size(statuslist){
                    statuspos = 0
                    }
                vstat = ds_list_find_value(statuslist,statuspos)
                }else{
                foundit = 1
                }
            }//end while
        if ds_list_size(statuslist) > 0{
            switch vstat{
                case 0: sprite_index = sstunicon; break;//stunned
                case 1: sprite_index = spgrenade; break;//boomy
                }
            }else{
            instance_destroy()
            }
        }
    }else{
    instance_destroy()
    }


    

