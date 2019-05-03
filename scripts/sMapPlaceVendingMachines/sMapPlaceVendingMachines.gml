/// @description sMapPlaceVendingMachineshowmany)
/*This script places door terminals on the map. It determines the best place for the tile by 
*/
var frequency,vtile,vterminal,vlist,howmany,i,vprio,vval,valuelist,j,ctile,vx,vy,k,velev,nlist,tileloops,vtype,vvalid,vheight;
howmany = argument0
tileloops = 0
while howmany > 0{//if there should be any tiles at all
    if tileloops > 20{
        show_message("Have tried "+string(tileloops)+" times to make vending machines, but nothing seems to work!")
        oMapControl.mapissolvable = 0
        howmany = 0
        }
    tileloops += 1
    vlist = ds_list_create()
    vprio = ds_priority_create()
    with oMapTile{
        if mx = 0 and my = 13{//debug find specific tile
            mx = 0
            }
        if ds_grid_get(tiletypegrid,mx,my) = 0{//regular tiles only
            vvalid = 0
            vheight = ds_grid_get(mapheightgrid,mx,my)
           // if ds_grid_get(savetilegrid,mx,my) = 0{
            if sIsTileLocationValid(mx,my-1) = 0{//if there is no north tile, the north wall is the big wall
                vvalid = 1
                }else{
                if ds_grid_get(mapheightgrid,mx,my-1) - vheight >= 3{//if the tile behind is at least 3 verts higher
                    if sIsTileLocationValid(mx,my+1) = 1{//if the tile isn't on the south brder                        
                        vvalid = 1
                        }
                    }
                }
            if sIsTileLocationValid(mx+1,my) = 0{//if there is no east tiles, east wall is big wall
                vvalid = 1
                }else{
                if ds_grid_get(mapheightgrid,mx+1,my) - vheight >= 3{//if the tile behing is at least 3 verts higher
                    if sIsTileLocationValid(mx-1,my) = 1{//if the tile isn't on the west border
                        vvalid = 1
                        }
                    }
                }
            //    }
            if vvalid = 1{
                ds_list_add(vlist,id)
                }
            }
        }
    
    if ds_list_size(vlist) > 0{//if there are any eligible tiles
        ds_list_shuffle(vlist)
        while ds_list_size(vlist) > 5{//the number of random tiles to pick from
            ds_list_delete(vlist,0)
            }
        while ds_list_size(vlist) > 0{//find the tile that is farthest from every other key tile
            vtile = ds_list_find_value(vlist,0)
            ds_list_delete(vlist,0)
            valuelist = ds_list_create()
            for(j = 0; j < ds_list_size(keytilelist); j += 1){//find the multiplied distance to each other key tile
                ctile = ds_list_find_value(keytilelist,j)
                vx = abs(vtile.mx - ctile.mx)
                vy = abs(vtile.my - ctile.my)
                velev = abs(vtile.elevation - ctile.elevation)//the elevation difference, maybe this isn't a good idea but play with it!
                vval = vx + vy//the total distance between two tiles
                vval += velev
                ds_list_add(valuelist,vval)
                }
            k = ds_list_find_value(valuelist,0)
            while ds_list_size(valuelist) > 0{
                k *= ds_list_find_value(valuelist,0)
                ds_list_delete(valuelist,0)
                }
            ds_list_destroy(valuelist)
            ds_priority_add(vprio,vtile,k)//add the tile with the multiplied distance from all key tiles
            
            }//done finding the furthest tile
        //make the terminal at the furthest tile
        
        vtile = ds_priority_find_max(vprio)
        nlist = ds_list_create()//add one of this tiles neighbors to the keytilelist - a neighbor so the actual tile can be
        //traversed to. There shouldn't be any other tiles down or map modifications so all existing neighbors should work
        if vtile.n > 0{
            ds_list_add(nlist,vtile.n)
            }
        if vtile.e > 0{
            ds_list_add(nlist,vtile.e)
            }
        if vtile.s > 0{
            ds_list_add(nlist,vtile.s)
            }
        if vtile.w > 0{
            ds_list_add(nlist,vtile.w)
            }
        ds_list_shuffle(nlist)
        var nosolution,jtile;
        nosolution = 1
        for (j = 0; j < ds_list_size(nlist); j += 1){
            jtile = ds_list_find_value(nlist,j)
            
            if abs(jtile.elevation - vtile.elevation) <= 1{//neighbor must be within 1 elevation so the terminal can be used
            //from that tile
                vtype = ds_grid_get(tiletypegrid,jtile.mx,jtile.my)
                if vtype > -1 and vtype < 7{//make sure that the tile is traversable
                    ds_list_add(keytilelist,jtile)
                    nosolution = 0
                    j = 100
                    }
                }
            }
        ds_list_destroy(nlist)    
        if nosolution = 0{//if there is a valid tile
            //vterminal = instance_create(vtile.x,vtile.y,oDoorTerminal)
            //vterminal.depth = vtile.depth-1
            //vterminal.mytile = vtile
            //vtile.elevation += vterminal.obstacleheight
            //vtile.myobject = vterminal
            //the terminal is actually made in sMapPlaceObstacles
            ds_grid_set(tiletypegrid,vtile.mx,vtile.my,8)
            //show_message("Placed a terminal at "+string(vtile.mx)+", "+string(vtile.my))
            ds_grid_set(savetilegrid,vtile.mx,vtile.my,1)//add the terminal tile to savetilegrid
            //ds_list_add(keytilelist,vtile)
            }else{
            howmany += 1
            //show_message("have to redo because terminal tile has no eligible neighbors")
            }
                
        }else{
        show_message("No eligible vending machine tiles!")
        }
    ds_list_destroy(vlist)
    ds_priority_destroy(vprio)
    howmany -= 1
    }
                            
                
