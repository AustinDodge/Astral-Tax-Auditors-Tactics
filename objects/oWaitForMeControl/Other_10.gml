var vcanmove,vtile,vlist,vdone,vunit;

vcanmove = 0
vdone = 0//if the Wait For Me unit has found a door tile to move to

vlist = ds_list_create()//a list of tiles that Wait for Me units are moving to

with oUnitParent{
    if team = 1{//if it's a player's unit
        if mytile.door != exitdoor{//if it's not on the exit door
            if ds_list_find_value(abilitieslist,30) = 1{//if the unit hast the Wait for Me ability
                vunit = id
                sunit = id
                ds_list_replace(abilitiesusedlist,30,1)//use ability Wait for Me
                sFindMoveRange(id)
                vdone = 0
                with oDoorTile{
                    if vdone = 0{//if a tile hasn't been found
                        if door = exitdoor{
                            if cango = 1 and occupied = 0{
                                if ds_list_find_index(vlist,id) = -1{//if a Wait for Me unit isn't already moving to this tile
                                    
                                    vtile = id
                                    ds_list_add(vlist,id)
                                    ds_list_add(oWaitForMeControl.unitlist,vunit)
                                    vdone = 1
                                    }
                                }
                            }
                        }
                    }//end with oDoorTile
                if vdone = 1{//if a tile was found to move to
                    sClickOnMoveRange(vtile)
                    vcanmove = 1
                    }
                }
            }
        }
    }
    
ds_list_destroy(vlist)
    
if vcanmove = 1{
    canclick = 0
    with oMoveRange{
        visible = 0
        }
    }else{
    done = 1
    }

