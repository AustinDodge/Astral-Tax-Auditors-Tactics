/// @description sMapPlaceObstacles(frequency)
/// @param frequency
/*This script finds the places where obstacles will go on the map. They aren't made until
sMapMakeObstacles is called.
*/
var frequency,vtile,vobstacle,vlist,howmany,allpath,forcenext,vn,ve,vs,vw,totalneighbors,vrand,vgrid,vsize,fourtilelist,twotilelist,onetilelist,templist,
ctile,j,vobstacle,vpos,velev,didtwo,southorwest;
frequency = argument0
howmany = 0
vrand = 0
vgrid = ds_grid_create(roomwidth,roomheight)
forcenext = 1//if the last place we put an obstacle blocked the map, guarantee an attempt on the next one
allpath = 1
sDFindMapContinuity(vstarttile)
with oMapTile{//set the old cost so we can check if new obstacles impact it too much
    ds_grid_set(vgrid,mx,my,mydistance)
    }
if frequency > 0{//if there should be any tiles at all
    vlist = ds_list_create()
    templist = ds_list_create()//the list of tiles that we're currently considering
    with oMapTile{
        vn = 0
        ve = 0
        vs = 0
        vw = 0
        if n > 0{
            if abs(n.elevation - elevation) <= 5{
                vn = 1
                }
            }
        if e > 0{
            if abs(e.elevation - elevation) <= 5{
                ve = 1
                }
            }
        if s > 0{
            if abs(s.elevation - elevation) <= 5{
                vs = 1
                }
            }
        if w > 0{
            if abs(w.elevation - elevation) <= 5{
                vw = 1
                }
            }
        totalneighbors = vn+ve+vs+vw
        if totalneighbors != 2{//if there are two neighbors, that tile is essential and cannot have an object on it
            if ds_grid_get(tiletypegrid,mx,my) = 0{
                ds_list_add(vlist,id)
                }
            /*if ds_grid_get(tiletypegrid,mx,my) = 0{//if it's a regular tile
                if maptype = 0{//cavern map
                    if ds_grid_get(savetilegrid,mx,my) = 0{//if it's not crucial to the path
                        ds_list_add(vlist,id)
                        }
                    }
                if maptype = 1{//catwalk map
                    //if object_index != oCatwalkTile{
                    ds_list_add(vlist,id)
                        //}
                    }
                }*/
            }
        }
    if ds_list_size(vlist) > 0{//if there are any eligible tiles
        ds_list_shuffle(vlist)
        if ds_list_size(vlist) > 0{//check again to make sure we didn't delete the only eligible tile
            //start by checking for four-tile obstacles
            for (i = 0; i < ds_list_size(vlist); i += 1){
                ds_list_clear(templist)
                vtile = ds_list_find_value(vlist,i)
                vrand = 0
                if forcenext = 1{
                    vrand = 0
                    }
                ds_list_add(templist,vtile)
                velev = vtile.elevation
                //see if the necessary neighbors are valid potential tiles
                if vtile.s > 0{
                    if ds_list_find_index(vlist,vtile.s) >= 0{
                        if (vtile.s).elevation = velev{
                            ds_list_add(templist,vtile.s)
                            }
                        }
                    }
                if vtile.w > 0{
                    if ds_list_find_index(vlist,vtile.w) >= 0{
                        if (vtile.w).elevation = velev{
                            ds_list_add(templist,vtile.w)
                            }
                        }
                    if (vtile.w).s > 0{
                        if ds_list_find_index(vlist,(vtile.w).s) >= 0{
                            if ((vtile.w).s).elevation = velev{
                                ds_list_add(templist,(vtile.w).s)
                                }
                            }
                        }
                    }
                if ds_list_size(templist) = 4{
                    //now we have a list containing four tiles that make a square, check if blocking them off would block the map
                    for(j = 0; j < ds_list_size(templist); j += 1){
                        ctile = ds_list_find_value(templist,j)
                        ds_grid_set(tiletypegrid,ctile.mx,ctile.my,6)
                        }
                    allpath = 1
                    sDFindMapContinuity(vstarttile)
                    with oMapTile{
                        if ds_grid_get(tiletypegrid,mx,my) >= 0 and ds_grid_get(tiletypegrid,mx,my) <= 4{//if it's a door or a blank tile
                            if cango = 0{
                                allpath = 0
                                }
                            if abs(ds_grid_get(vgrid,mx,my) - mydistance) > 5{//make sure it doesn't make the path too much longer
                                allpath = 0
                                }
                            }
                        }
                    forcenext = 0
                    if allpath = 0{
                        //if they would block off the path, reset them.
                        for(j = 0; j < ds_list_size(templist); j += 1){
                            ctile = ds_list_find_value(templist,j)
                            ds_grid_set(tiletypegrid,ctile.mx,ctile.my,0)//reset if that would block the path
                            }
                        //forcenext = 1
                        }else{
                        //if all tiles can be put into a four-tile obstacle
                        vrand = irandom(100)
                        if vrand < frequency/2{//half as likely since tables are so big
                            for(j = 0; j < ds_list_size(templist); j += 1){
                                ctile = ds_list_find_value(templist,j)
                                vobstacle = instance_create(ctile.x,ctile.y,oObstacle)
                                vobstacle.depth = ctile.depth-4
                                vobstacle.mytile = ctile
                                ctile.myobject = vobstacle
                                vobstacle.sprite_index = sprtable1
                                vobstacle.obstacleheight = 1
                                vobstacle.image_index = j
                                vpos = ds_list_find_index(vlist,ctile)
                                ds_list_delete(vlist,vpos)
                                }
                                
                            }else{
                                for(j = 0; j < ds_list_size(templist); j += 1){
                                ctile = ds_list_find_value(templist,j)
                                ds_grid_set(tiletypegrid,ctile.mx,ctile.my,0)//reset if that would block the path
                                }
                            }
                        }//end if allpath = 0 else
                    }//end size check
                }//end four tile for loop
            
            //now make two-tile objects
            for (i = 0; i < ds_list_size(vlist); i += 1){
                didtwo = 0
                southorwest = irandom(1)
                while didtwo < 2{
                    didtwo += 1
                    ds_list_clear(templist)
                    vtile = ds_list_find_value(vlist,i)
                    vrand = 0
                    if forcenext = 1{
                        vrand = 0
                        }
                    ds_list_add(templist,vtile)
                    velev = vtile.elevation
                    //randomly pick which is chosen first so there isn't a preference for south or west obstacles
                    switch southorwest{
                    //see if the necessary neighbors are valid potential tiles
                        case 0://south
                            if vtile.s > 0{
                                if ds_list_find_index(vlist,vtile.s) >= 0{
                                    if (vtile.s).elevation = velev{
                                        ds_list_add(templist,vtile.s)
                                        }
                                    }
                                }
                            ; break;
                        case 1:
                            if vtile.w > 0{
                                if ds_list_find_index(vlist,vtile.w) >= 0{
                                    if (vtile.w).elevation = velev{
                                        ds_list_add(templist,vtile.w)
                                        }
                                    }
                                }
                            ; break;
                        }
                    if ds_list_size(templist) = 2{
                        //now we have a list containing four tiles that make a square, check if blocking them off would block the map
                        for(j = 0; j < ds_list_size(templist); j += 1){
                            ctile = ds_list_find_value(templist,j)
                            ds_grid_set(tiletypegrid,ctile.mx,ctile.my,6)
                            }
                        allpath = 1
                        sDFindMapContinuity(vstarttile)
                        with oMapTile{
                            if ds_grid_get(tiletypegrid,mx,my) >= 0 and ds_grid_get(tiletypegrid,mx,my) <= 4{//if it's a door or a blank tile
                                if cango = 0{
                                    allpath = 0
                                    }
                                if abs(ds_grid_get(vgrid,mx,my) - mydistance) > 5{//make sure it doesn't make the path too much longer
                                    allpath = 0
                                    }
                                }
                            }
                        forcenext = 0
                        if allpath = 0{
                            //if they would block off the path, reset them.
                            for(j = 0; j < ds_list_size(templist); j += 1){
                                ctile = ds_list_find_value(templist,j)
                                ds_grid_set(tiletypegrid,ctile.mx,ctile.my,0)//reset if that would block the path
                                }
                            //forcenext = 1
                            }else{
                            //if all tiles can be put into a four-tile obstacle
                            didtwo = 2
                            vrand = irandom(100)
                            if vrand < frequency{//half as likely since tables are so big
                                for(j = 0; j < ds_list_size(templist); j += 1){
                                    ctile = ds_list_find_value(templist,j)
                                    vobstacle = instance_create(ctile.x,ctile.y,oObstacle)
                                    vobstacle.depth = ctile.depth-4
                                    vobstacle.mytile = ctile
                                    ctile.myobject = vobstacle
                                    switch southorwest{
                                        case 0: vobstacle.sprite_index = sprshelves1south; break;
                                        case 1: vobstacle.sprite_index = sprshelves1west; break;
                                        }
                                    vobstacle.image_index = j
                                    vobstacle.obstacleheight = 3
                                    vpos = ds_list_find_index(vlist,ctile)
                                    ds_list_delete(vlist,vpos)
                                    } 
                                }else{
                                for(j = 0; j < ds_list_size(templist); j += 1){
                                ctile = ds_list_find_value(templist,j)
                                ds_grid_set(tiletypegrid,ctile.mx,ctile.my,0)//reset if that would block the path
                                }
                            }
                            }//end if allpath = 0 else
                        }//end size check
                    }//end while didtwo
                }//end two tile for loop
            //now do single tile stuff
            for (i = 0; i < ds_list_size(vlist); i += 1){
                ds_list_clear(templist)
                vtile = ds_list_find_value(vlist,i)
                vrand = 0
                if forcenext = 1{
                    vrand = 0
                    }
                ds_list_add(templist,vtile)
                velev = vtile.elevation
                //see if the necessary neighbors are valid potential tiles
                //this if and list isn't really necessary with one tile but it doesn't hurt anything and keeps the code consistent
                if ds_list_size(templist) = 1{
                    //now we have a list containing four tiles that make a square, check if blocking them off would block the map
                    for(j = 0; j < ds_list_size(templist); j += 1){
                        ctile = ds_list_find_value(templist,j)
                        ds_grid_set(tiletypegrid,ctile.mx,ctile.my,6)
                        }
                    allpath = 1
                    sDFindMapContinuity(vstarttile)
                    with oMapTile{
                        if ds_grid_get(tiletypegrid,mx,my) >= 0 and ds_grid_get(tiletypegrid,mx,my) <= 4{//if it's a door or a blank tile
                            if cango = 0{
                                allpath = 0
                                }
                            if abs(ds_grid_get(vgrid,mx,my) - mydistance) > 5{//make sure it doesn't make the path too much longer
                                allpath = 0
                                }
                            }
                        }
                    forcenext = 0
                    if allpath = 0{
                        //if they would block off the path, reset them.
                        for(j = 0; j < ds_list_size(templist); j += 1){
                            ctile = ds_list_find_value(templist,j)
                            ds_grid_set(tiletypegrid,ctile.mx,ctile.my,0)//reset if that would block the path
                            }
                        //forcenext = 1
                        }else{
                        //if all tiles can be put into a four-tile obstacle
                        vrand = irandom(100)
                        if vrand < frequency/2{//half as likely since tables are so big
                            for(j = 0; j < ds_list_size(templist); j += 1){
                                ctile = ds_list_find_value(templist,j)
                                vobstacle = instance_create(ctile.x,ctile.y,oObstacle)
                                vobstacle.depth = ctile.depth-4
                                vobstacle.mytile = ctile
                                ctile.myobject = vobstacle
                                switch irandom(2){
                                    case 0: vobstacle.sprite_index = sObstacle1; break;
                                    case 1: vobstacle.sprite_index = sprtrashchute; vobstacle.obstacleheight = 2break;
                                    case 2: vobstacle.sprite_index = spflywheel; vobstacle.image_speed = 0.5; vobstacle.obstacleheight = 2break;
                                    }                                
                                vobstacle.image_index = 0
                                vpos = ds_list_find_index(vlist,ctile)
                                ds_list_delete(vlist,vpos)
                                }
                            }else{
                                for(j = 0; j < ds_list_size(templist); j += 1){
                                ctile = ds_list_find_value(templist,j)
                                ds_grid_set(tiletypegrid,ctile.mx,ctile.my,0)//reset if that would block the path
                                }
                            }
                        }//end if allpath = 0 else
                    }//end size check
                }//end four tile for loop
            }//end size check
        }//end redundant size check
    ds_list_destroy(vlist)
    ds_list_destroy(templist)
    }
    
ds_grid_destroy(vgrid) 




/*
//this is a copy of the original script for reference, delete when done
    
if frequency > 0{//if there should be any tiles at all
    vlist = ds_list_create()
    fourtilelist = ds_list_create()//a tile that can have a four square tile obstacle on it
    twotilelist = ds_list_create()//a tile that can have a two square tile obstacle on it
    onetilelist = ds_list_create()//a tile that cna have a single square tile obstacle on it
    templist = ds_list_create()//the list of tiles that we're currently considering
    with oMapTile{
        vn = 0
        ve = 0
        vs = 0
        vw = 0
        if n > 0{
            if abs(n.elevation - elevation) <= 5{
                vn = 1
                }
            }
        if e > 0{
            if abs(e.elevation - elevation) <= 5{
                ve = 1
                }
            }
        if s > 0{
            if abs(s.elevation - elevation) <= 5{
                vs = 1
                }
            }
        if w > 0{
            if abs(w.elevation - elevation) <= 5{
                vw = 1
                }
            }
        totalneighbors = vn+ve+vs+vw
        if totalneighbors != 2{//if there are two neighbors, that tile is essential and cannot have an object on it
            if ds_grid_get(tiletypegrid,mx,my) = 0{
                ds_list_add(vlist,id)
                }
            /*if ds_grid_get(tiletypegrid,mx,my) = 0{//if it's a regular tile
                if maptype = 0{//cavern map
                    if ds_grid_get(savetilegrid,mx,my) = 0{//if it's not crucial to the path
                        ds_list_add(vlist,id)
                        }
                    }
                if maptype = 1{//catwalk map
                    //if object_index != oCatwalkTile{
                    ds_list_add(vlist,id)
                        //}
                    }
                }*/
 /*o           }
        }
    if ds_list_size(vlist) > 0{//if there are any eligible tiles
        ds_list_shuffle(vlist)
        if ds_list_size(vlist) > 0{//check again to make sure we didn't delete the only eligible tile
            //start by checking for four-tile obstacles
            for (i = 0; i < ds_list_size(vlist); i += 1){
                ds_list_clear(templist)
                vtile = ds_list_find_value(vlist,0)
                ds_list_delete(vlist,0)
                vrand = irandom(100)
                if forcenext = 1{
                    vrand = 0
                    }
                if vrand < frequency{
                    //now we check each tile that can potentially have an obstacle on it and see what size obstacle is valid
                    ds_grid_set(tiletypegrid,vtile.mx,vtile.my,6)
                    allpath = 1
                    sDFindMapContinuity(vstarttile)
                    with oMapTile{
                        if ds_grid_get(tiletypegrid,mx,my) >= 0 and ds_grid_get(tiletypegrid,mx,my) <= 4{//if it's a door or a blank tile
                            if cango = 0{
                                allpath = 0
                                }
                            if abs(ds_grid_get(vgrid,mx,my) - mydistance) > 5{//make sure it doesn't make the path too much longer
                                allpath = 0
                                }
                            }
                        }
                    forcenext = 0
                    if allpath = 0{
                        ds_grid_set(tiletypegrid,vtile.mx,vtile.my,0)//reset if that would block the path
                        //forcenext = 1
                        }else{
                        ds_list_add(vtile,templist)
                        }
                    }
                }
            }
        }
    ds_list_destroy(vlist)
    }

//show_message(howmany)