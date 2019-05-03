var vtilelist,vtileprio,vprio,vx,vy,vt;

stage = 0
canclick = 0
/*
0 init
1 make stand-in 
2 replace with real nemesis
3 destroy self
*/

nemtile = 0
nemobject = 0
neminstance = 0
nemstandin = 0

if nemesisonmap = 0{//if the nemesis hasn't been placed
    nemesisonmap = 1
    vtilelist = ds_list_create()//the list of valid tiles for the Nemesis to spawn on
    /*The first place to try to spawn the nemesis on is any entry door tile that's not
    occupied.
    */
    
    with oMapTile{
        if door = entrydoor{
            if occupied = 0{
                ds_list_add(vtilelist,id)
                }
            }
        }
        
    if ds_list_size(vtilelist) > 0{
        ds_list_shuffle(vtilelist)
        nemtile = ds_list_find_value(vtilelist,0)
        }else{
        show_message("no valid tile for nemesis on entrydoor, placing on closest tile")
        //find the closest unoccupied tile to a randomly chosen door tile
        vtileprio = ds_priority_create()
        ds_list_clear(vtilelist)
        with oMapTile{
            if door = entrydoor{
                ds_list_add(entrydoor)
                }
            }
        ds_list_shuffle(vtilelist)
        vt = ds_list_find_value(vtilelist,0)
        vx = vt.mx
        vy = vt.my
        with oMapTile{
            if ds_grid_get(tiletypegrid,mx,my) = 0{
                if occupied = 0{
                    vprio = point_distance(vx,vy,mx,my)
                    ds_priority_add(vtileprio,id,vprio)
                    }
                }
            }
        if ds_list_size(vtileprio) > 0{
            nemtile = ds_priority_find_min(vtileprio)
            ds_priority_destroy(vtileprio)
            }else{
            show_message("No unoccupied tiles while placing nemesis, what???")
            }
        }
    ds_list_destroy(vtilelist)
    instance_create(x,y,oActionControl)
    sCameraMoveTarget(nemtile,1,2,5)
    stage = 1
    }else{//if the nemesis is already on the map
    instance_create(x,y,oActionControl)
    instance_destroy()
    }
        

/* */
/*  */
