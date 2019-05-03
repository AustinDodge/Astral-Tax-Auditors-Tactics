/// @description sDrawTileWalls()

//this script draws the walls described in sMakeTileWalls
/*don't forget that the tile walls are described with the bottom left corner at 0,0
*/

var vx,vy,px,py,startx,starty,gridheight,startpx,listsize,vgrid,i,vtile,vtile2,vval,drawbordleft,drawbordright,vbg,
vin,vtall,vshort,atile,vdepth;

//start by drawing the south facing walls


for (i = 0; i < ds_list_size(tilewallslist); i += 1){
    vgrid = ds_list_find_value(tilewallslist,i)//get the grid to draw
    vtile = ds_grid_get(tilegrid,0,i)
    //vtile.atile = 1
    //vtile = ds_grid_get(tilegrid,0,i)//the tile to start drawing from
    px = vtile.x
    py = vtile.y+(vtile.elevation*elevheight)+1
    startx = px
    starty = py
    //show_message(ds_grid_width(vgrid))
    vx = 0
    vy = 0
    drawbordright = 0
    if vtile.e <= 0{
        drawbordright = 1
        }else{
        if (vtile.e).object_index = oCatwalkTile and vtile.my < roomheight-1{
            drawbordright = 1
            }
        }
    switch maptheme{
        case 0: vbg = industrialbg1; break;
        case 1: vbg = parkbg1; break;
        }    
    if drawbordright = 1{
        switch maptheme{
            case 0: vbg = industrialbgborderright; break;
            case 1: vbg = parkbgborderright; break;
            }
        }
    while vx < ds_grid_width(vgrid){
        vval = ds_grid_get(vgrid,vx,vy)
        if vtile.e > 0{
            var jtile;
            jtile = vtile.e
            if jtile.elevation < vy{
                if jtile.s > 0{
                    if (jtile.s).elevation < vy{
                        switch maptheme{
                            case 0: vbg = industrialbgborderright; break;
                            case 1: vbg = parkbgborderright; break;
                            }
                        }
                    }else{
                    switch maptheme{
                        case 0: vbg = industrialbgborderright; break;
                        case 1: vbg = parkbgborderright; break;
                        }
                    }
                }
            }
        if vval != -1{//don't draw anything on negative one, otherwise add a tile at vtiles depth + 1
            vdepth = vtile.depth + 1
            if i = ds_list_size(tilewallslist)-1{
                //vdepth = -100
                }
            if vval < 10{
                if i < ds_list_size(tilewallslist)-1{
                    tile_add(vbg,tilewallw*3,vval*tilewallh,tilewallw,tilewallh,px,py,vdepth)
                    }else{//if it's the front wall
                    vbg = frontwallbg1
                    vdepth = -100
                    tile_add(vbg,tilewallw,vval*(tilewallh+1),tilewallw,(tilewallh+1),px,py,vdepth)
                    }
                }else{
                vbg = elevatorwallbg
                vin = 0
                switch vval{
                    case 13:vin = 1; break;//tile_add(vbg,tilewallw*3,tilewallh*0,tilewallw,tilewallh,px,py,vdepth); break;//inner small
                    case 14:tile_add(vbg,tilewallw*3,tilewallh*1,tilewallw,tilewallh,px,py,vdepth); break;//outer
                    //case 15:tile_add(vbg,tilewallw*1,bigwallh*3,tilewallw,bigwallh,px,py,vdepth); break;//inner big
                    }
                if vin = 1{//if we're trying to add a tall inner tile
                    
                    
                    vtall = 0
                    vshort = 0
                    vval = vtile.elevation
                    
                    //if any of the adjacent tiles need to be accounted for
                    if sIsTileLocationValid(vx-1,i){
                        vtile2 = ds_grid_get(tilegrid,vx-1,i)
                        if vtile2.elevation < vval{
                            if vtile2.s > 0{
                                if (vtile2.s).object_index = oDoorTile{
                                    vval = vtile2.elevation
                                    }
                                }
                            }
                        }
                    if sIsTileLocationValid(vx-2,i){//also check the far far one, so they stay consistently drawn
                        vtile2 = ds_grid_get(tilegrid,vx-2,i)
                        if vtile2.elevation < vval{
                            if vtile2.s > 0{
                                if (vtile2.s).object_index = oDoorTile{
                                    vval = vtile2.elevation
                                    }
                                }
                            }
                        }
                    if sIsTileLocationValid(vx+1,i){
                        vtile2 = ds_grid_get(tilegrid,vx+1,i)
                        if vtile2.elevation < vval{
                            if vtile2.s > 0{
                                if (vtile2.s).object_index = oDoorTile{
                                    vval = vtile2.elevation
                                    }
                                }
                            }
                        }
                    if sIsTileLocationValid(vx+2,i){
                        vtile2 = ds_grid_get(tilegrid,vx+2,i)
                        if vtile2.elevation < vval{
                            if vtile2.s > 0{
                                if (vtile2.s).object_index = oDoorTile{
                                    vval = vtile2.elevation
                                    }
                                }
                            }
                        }
                    if vval < vy{
                        vval = vtile.elevation
                        }
                    vval -= vy
                    //vval += 1
                    if vval/4 = floor(vval/4){
                        vtall = 1
                        if vy + 3 < ds_grid_height(vgrid){
                            if ds_grid_get(vgrid,vx,vy+3) != 13{
                                vtall = 0
                                vshort = 1
                                }
                            }else{
                            vtall = 0
                            vshort = 1
                            }
                        }else{
                        vshort = 1
                        }
                    if vtall = 1{
                        py -= (elevheight*3)//big wall
                        tile_add(vbg,tilewallw*1,bigwallh*3,tilewallw,bigwallh,px,py,vdepth)
                        vy += 3
                        }else{
                        tile_add(vbg,tilewallw*3,tilewallh*0,tilewallw,tilewallh,px,py,vdepth)
                        }
                    //this whole thing is probably way more complicated than it needs to be and I realize that I might have fixed my old one by moving the py -=. Oh well!
                    }
                }
            }
        vy += 1//move the grid data position up one
        py -= elevheight//move the drawing position up

        if vy >= ds_grid_height(vgrid){
            vy = 0
            vx += 1
            px += tilewallw
            py = starty - wallslope*(vx)
            //if i < ds_grid_width(vgrid) and vx < ds_grid_width(tilegrid){//prevent a grid out of bounds situation
            if i < ds_grid_height(tilegrid) and vx < ds_grid_width(tilegrid){
                vtile = ds_grid_get(tilegrid,vx,i)
                drawbordright = 0
                if vtile.my < ds_grid_height(tilegrid)-1{
                    if vtile.e <= 0{
                        drawbordright = 1
                        }else{
                        if (vtile.e).object_index = oCatwalkTile{
                            drawbordright = 1
                            }
                        }
                    }
                if vtile.mx = ds_grid_width(tilegrid)-1{
                    drawbordright = 1
                    }
                switch maptheme{
                    case 0: vbg = industrialbg1; break;
                    case 1: vbg = parkbg1; break;
                    }    
                if drawbordright = 1{
                    switch maptheme{
                        case 0: vbg = industrialbgborderright; break;
                        case 1: vbg = parkbgborderright; break;
                        }
                    }
                //vtile.atile = 1
                }
            
            }
        }
    ds_grid_destroy(vgrid)
    }
ds_list_destroy(tilewallslist)


//now we draw the west facing walls 
for (i = 0; i < ds_list_size(tilewallwlist); i += 1){
    vgrid = ds_list_find_value(tilewallwlist,i)//get the grid to draw
    vtile = ds_grid_get(tilegrid,i,0)//move along the x axis, drawing walls down the y axis
    //vtile.atile = 1
    //vtile = ds_grid_get(tilegrid,0,i)//the tile to start drawing from
    px = vtile.x-drawtilexadd
    py = vtile.y+(vtile.elevation*elevheight)+1
    startx = px
    starty = py
    //show_message(ds_grid_width(vgrid))
    vx = 0
    vy = 0
        
    while vx < ds_grid_width(vgrid){
        switch maptheme{
            case 0: vbg = industrialbg1; break;
            case 1: vbg = parkbg1; break;
            }
        vval = ds_grid_get(vgrid,vx,vy)
        if vval != -1{//don't draw anything on negative one, otherwise add a tile at vtiles depth + 1
            vdepth = vtile.depth + 1
            if i = 0{
                //vdepth = -100
                }
            if vval < 10{
                if i > 0{//if it's not the front wall
                    tile_add(vbg,tilewallw*2,vval*tilewallh,tilewallw,tilewallh,px,py,vdepth)
                    }else{//if it's the front wall
                    vbg = frontwallbg1
                    vdepth = -100
                    tile_add(vbg,0,vval*(tilewallh+1),tilewallw,(tilewallh+1),px,py,vdepth)
                    }
                }else{
                vbg = elevatorwallbg
                vin = 0
                switch vval{
                    case 13:vin = 1; break;//tile_add(vbg,tilewallw*3,tilewallh*0,tilewallw,tilewallh,px,py,vdepth); break;//inner small
                    case 14:tile_add(vbg,tilewallw*2,tilewallh*1,tilewallw,tilewallh,px,py,vdepth); break;//outer
                    //case 15:tile_add(vbg,tilewallw*1,bigwallh*3,tilewallw,bigwallh,px,py,vdepth); break;//inner big
                    }
                if vin = 1{//if we're trying to add a tall inner tile
                    
                    
                    vtall = 0
                    vshort = 0
                    vval = vtile.elevation
                    
                    //if any of the adjacent tiles need to be accounted for
                    if sIsTileLocationValid(i,vx-1){
                        vtile2 = ds_grid_get(tilegrid,i,vx-1)
                        if vtile2.elevation < vval{
                            if vtile2.w > 0{
                                if (vtile2.w).object_index = oDoorTile{
                                    vval = vtile2.elevation
                                    }
                                }
                            }
                        }
                    if sIsTileLocationValid(i,vx-2){
                        vtile2 = ds_grid_get(tilegrid,i,vx-2)
                        if vtile2.elevation < vval{
                            if vtile2.w > 0{
                                if (vtile2.w).object_index = oDoorTile{
                                    vval = vtile2.elevation
                                    }
                                }
                            }
                        }
                    if sIsTileLocationValid(i,vx+1){
                        vtile2 = ds_grid_get(tilegrid,i,vx+1)
                        if vtile2.elevation < vval{
                            if vtile2.w > 0{
                                if (vtile2.w).object_index = oDoorTile{
                                    vval = vtile2.elevation
                                    }
                                }
                            }
                        }
                    if sIsTileLocationValid(i,vx+2){
                        vtile2 = ds_grid_get(tilegrid,i,vx+2)
                        if vtile2.elevation < vval{
                            if vtile2.w > 0{
                                if (vtile2.w).object_index = oDoorTile{
                                    vval = vtile2.elevation
                                    }
                                }
                            }
                        }
                    if vval < vy{
                        vval = vtile.elevation
                        }
                    vval -= vy
                    if vval/4 = floor(vval/4){
                        vtall = 1
                        if vy + 3 < ds_grid_height(vgrid){
                            if ds_grid_get(vgrid,vx,vy+3) != 13{
                                vtall = 0
                                vshort = 1
                                }
                            }else{
                            vtall = 0
                            vshort = 1
                            }
                        }else{
                        vshort = 1
                        }
                    if vtall = 1{
                        py -= (elevheight*3)//big wall 
                        tile_add(vbg,tilewallw*0,bigwallh*3,tilewallw,bigwallh,px,py,vdepth)
                        vy += 3
                        }else{
                        tile_add(vbg,tilewallw*2,tilewallh*0,tilewallw,tilewallh,px,py,vdepth)
                        }
                    //this whole thing is probably way more complicated than it needs to be and I realize that I might have fixed my old one by moving the py -=. Oh well!
                    }
                }
            }
        vy += 1//move the grid data position up one
        py -= elevheight//move the drawing position up
        
        if vy >= ds_grid_height(vgrid){
            vy = 0
            vx += 1
            px += tilewallw
            py = starty + wallslope*(vx)
            if i < ds_grid_width(tilegrid) and vx < ds_grid_width(vgrid){//prevent a grid out of bounds situation
                vtile = ds_grid_get(tilegrid,i,vx)
                //vtile.atile = 1
                }
            //show_message(vx)
            
            }
        }
    ds_grid_destroy(vgrid)
    }
ds_list_destroy(tilewallwlist)
