/// @description sMapPlaceElevators()
/*this script is ran to place elevators on the map where they're needed to reach certain
areas. First djkstra is run in sDFindMapContinuity, then we see if there are any tiles
that cannot be currently reached. If so, we put down elevators so those areas can be
reached. We then check again if the whole map can be reached, continuing to put down
more elevators until the whole map has some sort of path to everywhere. When that happens
we check if there are any good spots to put down some random elevators.
*/
var allpath,potelevatorlist,potelevatortpriority,j,canelevator,velev,i,vtile,vsize,etile,atile,vmax,cmax,pathloops,checkedelevatorlist;
allpath = 0//if there is continuity to every part of the map
potelevatorlist = ds_list_create()
potelevatorpriority = ds_priority_create()
pathloops = 0
while allpath = 0{
    pathloops += 1
    if pathloops >= 20{
        //show_message("Caught in an infinite loop trying to make a path through the room!")
        }
    ds_list_clear(potelevatorlist)
    ds_priority_clear(potelevatorpriority)
    allpath = 1
    //find the start tile closest to the corner closest to the camera, (0,roomheight)
    var vx,vy,howmany;
    vx = 0
    vy = roomheight-1
    howmany = 1
    //vstarttile is found in sMapFindContinuityStartTile
    if !instance_exists(vstarttile){//re-check in case it got turned into an elevator and we need a new start tile
        sMapFindContinuityStartTile()
        }
    sDFindMapContinuity(vstarttile)
    with oMapTile{
        //if object_index != oPitTile{
        if ds_grid_get(tiletypegrid,mx,my) < 6 and ds_grid_get(tiletypegrid,mx,my) >= 0{//if it's a door or plain tile
            if cango = 0{
                allpath = 0
                if pathloops = 19{
                    //show_message(string(mx)+","+string(my))
                    }
                }
            }
        }
    if allpath = 0{//if there's no path through everything
        with oMapTile{
            if object_index != oPitTile{
                canelevator = 0
                if cango = 1{
                    if ds_grid_get(tiletypegrid,mx,my) = 0{//if the tile is currently blank
                        vmax = 0
                        if n > 0{
                            if n.cango = 0{
                                //if n.object_index != oPitTile{
                                if ds_grid_get(tiletypegrid,n.mx,n.my) = 0{
                                    canelevator = 1
                                    if n.elevation > elevation {
                                        atile = id
                                        }else{
                                        atile = n
                                        }
                                    }
                                }
                            }
                        if e > 0{
                            //if e.object_index != oPitTile{
                            if ds_grid_get(tiletypegrid,e.mx,e.my) = 0{
                                if e.cango = 0{
                                    canelevator = 1
                                    if e.elevation > elevation{
                                        atile = id
                                        }else{
                                        atile = e
                                        }
                                    }
                                }
                            }
                        if s > 0{
                            //if s.object_index != oPitTile{
                            if ds_grid_get(tiletypegrid,s.mx,s.my) = 0{
                                if s.cango = 0{
                                    canelevator = 1
                                    if s.elevation > elevation{
                                        atile = id
                                        }else{
                                        atile = s
                                        }
                                    }
                                }
                            }
                        if w > 0{
                            //if w.object_index != oPitTile{
                            if ds_grid_get(tiletypegrid,w.mx,w.my) = 0{
                                if w.cango = 0{
                                    canelevator = 1
                                    if w.elevation > elevation{
                                        atile = id
                                        }else{
                                        atile = w
                                        }
                                    }
                                }
                            }
                        }//end checking if tile is blank
                    }//end checking cango
                if id = oMapControl.vstarttile{
                    canelevator = 0
                    }
                if canelevator = 1{//add to list if an elevator is possible there
                    ds_list_add(potelevatorlist,atile)
                    }
                }
            }//end with oMapTile
        ds_list_shuffle(potelevatorlist)
        vsize = ds_list_size(potelevatorlist)
        if vsize > 0{
            for (i = 0; i < vsize; i += 1){
                vtile = ds_list_find_value(potelevatorlist,i)
                j = sTileElevatorCheck(vtile)//check how appropriate that tile is for an elevator
                ds_priority_add(potelevatorpriority,vtile,j)
                }
            etile = ds_priority_find_max(potelevatorpriority)
            if etile != undefined{
                sTileElevatorChange(etile)
                }else{
                show_message("potential elevator tile was undefined - I don't know how that could have happened!")
                }
            }
        ds_list_clear(potelevatorlist)
        ds_priority_clear(potelevatorpriority)
        if pathloops >= 30{
            //show_message("aborting elevators to escape loop, room may not be solvable")
            allpath = 1
            oMapControl.mapissolvable = 0
            }
        }//end checking if all tiles can be accessed
    }

ds_list_clear(potelevatorlist)

with oMapTile{//put all other potential non-essential elevator tiles 
    if round(ds_grid_get(tiletypegrid,mx,my)) = 0{//if the tile is blank
        canelevator = 0
        if n > 0{
            if n.object_index != oPitTile{
                if n.elevation > elevation + 2{
                    canelevator = 1
                    }
                }
            }
        if e > 0{
            if e.object_index != oPitTile{
                if e.elevation > elevation + 2{
                    canelevator = 1
                    }
                }
            }
        if s > 0{
            if s.object_index != oPitTile{
                if s.elevation > elevation + 2{
                    canelevator = 1
                    }
                }
            }
        if w > 0{
            if w.object_index != oPitTile{
                if w.elevation > elevation + 2{
                    canelevator = 1
                    }
                }
            }
        if id = oMapControl.vstarttile{
            canelevator = 0
            }
        if canelevator = 1{
            if ds_grid_value_disk_exists(tiletypegrid,mx,my,2,5) = 0{//if there's not already an elevator nearby that tile
                ds_list_add(potelevatorlist,id)
                }
            }
        }
    }

vsize = ds_list_size(potelevatorlist)
if vsize > 0{
    for (i = 0; i < vsize; i += 1){
        vtile = ds_list_find_value(potelevatorlist,i)
        if instance_exists(vtile){//it may have gotten destroyed when making another elevator
            if ds_grid_get(tiletypegrid,vtile.mx,vtile.my) = 0{//check if that tile is still not an elevator, as that can change
                vmax = 0
                with vtile{
                    if n > 0{
                        if n.elevation > vmax{
                            vmax = n.elevation
                            etile = n
                            elevatordirection = 1
                            }
                        }
                    if e > 0{
                        if e.elevation > vmax{
                            vmax = e.elevation
                            etile = e
                            elevatordirection = 2
                            }
                        }
                    if s > 0{
                        if s.elevation > vmax{
                            vmax = s.elevation
                            etile = s
                            elevatordirection = 3
                            }
                        }
                    if w > 0{
                        if w.elevation > vmax{
                            vmax = w.elevation
                            etile = w
                            elevatordirection = 4
                            }
                        }
                    }
                sDFindMapContinuity(vtile)
                j = etile.mydistance//find the djkstra distance from the lower tile to the higher tile
                if j > 6{
                    var vchance;
                    vchance = 1
                    if ds_grid_value_disk_exists(tiletypegrid,vtile.mx,vtile.my,2,5){//lower the chance if there's already an elevator nearby
                        vchance += 3
                        }
                    if irandom(vchance) = 0{
                        sTileElevatorChange(vtile)
                        }
                    }
                }
            }
        }//end for loop
    }
                    
        

ds_list_destroy(potelevatorlist)
ds_priority_destroy(potelevatorpriority)


















