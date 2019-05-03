/// @description sDrawIndSmallPipeScript(vgrid,vtile,southorwest,vx,vy)
/// @param vgrid
/// @param vtile
/// @param southorwest
/// @param vx
/// @param vy
/*This script is called by sWallDrawSetIndSmallPipes when it finds a valid tile
to put small pipes down on. It starts at the indicated position, and starts putting
down tiles in a line in a random direction(out of the available directions). Each time
there is a chance that it will change direction. If all three directions are valid,
there is a small chance it will put down a tile in every direction. If it runs out
of room the line ends, or there is a small chance that the line will end by itself.

Remember that the wallgrids x and y start in the bottom left, visually.
*/

var vgrid,vtile,southorwest,vx,vy,canup,candown,canleft,canright,vdir,pdir,done,vcell,firstone,vlist,endhere,tx,ty,
tiley,vstr,dx,dy,vheight,vwidth,k,vmade,gtile,vbg;
vgrid = argument0
vtile = argument1
southorwest = argument2
vx = argument3
vy = argument4

switch maptheme{
    case 0: vbg = industrialbg1; break;
    case 1: vbg = parkbg1; break;
    }

canup = 0
candown = 0
canleft = 0
canright = 0
vdir = -1
pdir = -1

tx = vtile.mx
ty = vtile.my

done = 0

vcell = -1

tiley = 0//the y position of the background tile in the background image


vwidth = ds_grid_width(vgrid)
vheight = ds_grid_width(vgrid)


firstone = 1//if this is the very first piece of the pipe being put down
vlist = ds_list_create()
vmade = 0

while done = 0{//main loop
    //determine what directions are valid
    canleft = 0
    canright = 0
    canup = 0
    candown = 0
    endhere = 0
    if vtile.object_index = oElevatorTile{
        endhere = 1
        }
    if vx > 0{
        vcell = ds_grid_get(vgrid,vx-1,vy)
        if vcell = 1{
            if southorwest = 0{
                gtile = ds_grid_get(tilegrid,tx-1,ty)
                }else{
                gtile = ds_grid_get(tilegrid,tx,ty-1)
                }
            if gtile.object_index != oElevatorTile{
                canleft = 1
                }
            }
        }
    if vx < ds_grid_width(vgrid)-2{
        vcell = ds_grid_get(vgrid,vx+1,vy)
        if vcell = 1{
            if southorwest = 0{
                gtile = ds_grid_get(tilegrid,tx+1,ty)
                }else{
                gtile = ds_grid_get(tilegrid,tx,ty+1)
                }
            if gtile.object_index != oElevatorTile{
                canright = 1
                }
            }
        }
    if vy > 0{
        vcell = ds_grid_get(vgrid,vx,vy-1)
        if vcell = 1{
            candown = 1
            }
        }
    if vy < ds_grid_height(vgrid)-2{
        vcell = ds_grid_get(vgrid,vx,vy+1)
        if vcell = 1{
            canup = 1
            }
        }
    //we now know which directions we can move in. Pick one.
    ds_list_clear(vlist)
    if canup = 1{
        ds_list_add(vlist,0)
        ds_list_add(vlist,0)
        if maptheme = 1{//park theme
            ds_list_add(vlist,0)
            ds_list_add(vlist,0)
            }
        //add up and down twice, since those tiles are smaller.
        }
    if candown = 1{
        ds_list_add(vlist,2)
        ds_list_add(vlist,2)
        if maptheme = 1{//park theme
            ds_list_add(vlist,2)
            ds_list_add(vlist,2)
            }
        }
    if canleft = 1{
        ds_list_add(vlist,1)
        
        }
    if canright = 1{
        ds_list_add(vlist,3)
        }
    //all directions possible are on the list.
    if ds_list_size(vlist) > 0{//if there are possible directions to move in
        ds_list_shuffle(vlist)
        vdir = ds_list_find_value(vlist,0)
        }else{
        endhere = 1
        vdir = -1
        }
    
    
    if vmade > 2{
        if irandom(6) = 0{
            endhere = 1
            //done = 1
            vdir = -1
            }
        }
    if firstone = 1{
        if vdir != 2{
            //done = 1//debug, only allow up pipes to start
            }
        }
    if endhere = 1 and firstone = 1{//if we can't lay down more than a single pipe, can't lay down any
        done = 1
        }
    if pdir = -1 and vdir = -1{
        done = 1
        k = 0//debug breakpoint
        }
    ds_grid_set(vgrid,vx,vy,2)//set the current tile as having dressing on it
    
    if firstone = 0 and pdir = -1{
        k = 0//debug breakpoint
        }
    
    //now put down the previous tile
    if pdir = -1{//if this is the first tile we're putting down
        switch vdir{// end tiles
            case 0: tiley = 3; break;//up
            case 1: tiley = 9; break;//left
            case 2: tiley = 0; break;//down
            case 3: tiley = 10;break;//right
            }
        }else{//if this is not the first one,
        if vdir != -1{//and we won't be ending it
            vstr = string(vdir) + string(pdir)
            //tiley = 10
            switch vstr{
                case "00": tiley = choose(1,2); break;//vertical
                case "02": tiley = choose(1,2); break;//vertcal
                case "20": tiley = choose(1,2); break;//vertical
                case "22": tiley = choose(1,2); break;//vertical
                
                case "10": tiley = 5; break;//left up
                case "01": tiley = 6; break;//up left
                
                case "30": tiley = 4; break;//right up
                case "03": tiley = 7; break;//up right
                
                case "12": tiley = 7; break;//left down
                case "21": tiley = 4; break;//down left
                
                case "32": tiley = 6; break;//right down
                case "23": tiley = 5; break;//down right
                
                case "11": tiley = 8; break;//horizontal
                case "13": tiley = 8; break;//horizontal
                case "33": tiley = 8; break;//horizontal
                case "31": tiley = 8; break;//horizontal
                }
            }else{//if we will be ending it
            switch pdir{
                case 0: tiley = 0; break;//previous tile went up
                case 1: tiley = 10; break;//left
                case 2: tiley = 3; break;//down
                case 3: tiley = 9; break;//right
                }
            }
        }
    if done = 0{
        if southorwest = 0{
            dx = vtile.x-drawtilexadd
            dy = vtile.y+(vtile.elevation*elevheight)+1
            //dy = vtile.y-((vup+1)*elevheight)
            dy -= elevheight*(vy+1)
            dy -= 4
            tile_add(vbg,tilewallw*5,tilewallh*tiley,tilewallw,tilewallh,dx,dy,vtile.depth+3)
            if firstone = 1{
                //tile_add(bluebg,0,0,5,5,dx-3,dy,vtile.depth+2)
                }
            if endhere = 1{
                //tile_add(redbg,0,0,5,5,dx+3,dy,vtile.depth+2)//put a red dot at the end
                }
            ds_grid_set(vgrid,vx,vy,2)
            //now find the next vtile
            switch vdir{
                case 0: ; break;//up
                case 1: tx -= 1; break;//left
                case 2: ; break;//down
                case 3: tx += 1; break;//right
                }
            if sIsTileLocationValid(tx,ty) = 0{
                show_message("")
                }
            if vdir > -1{
                vtile = ds_grid_get(tilegrid,tx,ty)
                }
            }else{
            dx = vtile.x
            //dy = vtile.y-((vup+1)*elevheight)
            dy = vtile.y+(vtile.elevation*elevheight)+1
            dy -= elevheight*(vy+1)
            dy -= 4
            tile_add(vbg,tilewallw*4,tilewallh*tiley,tilewallw,tilewallh,dx,dy,vtile.depth+3)
            if firstone = 1{
                //tile_add(bluebg,0,0,5,5,dx-3,dy,vtile.depth+2)
                }
            if endhere = 1{
                //tile_add(redbg,0,0,5,5,dx+3,dy,vtile.depth+2)//put a red dot at the end
                }
            ds_grid_set(vgrid,vx,vy,2)
            //now find the next vtile
            switch vdir{
                case 0: ; break;//up
                case 1: ty -= 1; break;//left
                case 2: ; break;//down
                case 3: ty += 1; break;//right
                }
            if sIsTileLocationValid(tx,ty) = 0{
                show_message("")
                }
            if vdir > -1{
                vtile = ds_grid_get(tilegrid,tx,ty)
                }
            }
        switch vdir{
            case 0: vy += 1; break;//up
            case 1: vx -= 1; break;//left
            case 2: vy -= 1; break;//down
            case 3: vx += 1; break;//right
            }
        //if we're ending it here, put in the end pipe.
        if endhere = 1{
            done = 1
            /*if pdir > -1{
                switch pdir{
                    case 0: tiley = 0; break;//previous tile went up
                    case 1: tiley = 9; break;//left
                    case 2: tiley = 3; break;//down
                    case 3:tiley = 10; break;//right
                    }
                if southorwest = 0{
                    dx = vtile.x-drawtilexadd
                    dy = vtile.y+(vtile.elevation*elevheight)+1
                    //dy = vtile.y-((vup+1)*elevheight)
                    dy -= elevheight*(vy+1)
                    dy -= 3
                    tile_add(industrialbg1,tilewallw*5,tilewallh*tiley,tilewallw,tilewallh,dx,dy,vtile.depth+3)
                    tile_add(redbg,0,0,5,5,dx+3,dy,vtile.depth+2)//put a red dot at the end
                    ds_grid_set(vgrid,vx,vy,2)
                    }else{
                    dx = vtile.x
                    //dy = vtile.y-((vup+1)*elevheight)
                    dy = vtile.y+(vtile.elevation*elevheight)+1
                    dy -= elevheight*(vy+1)
                    dy -= 3
                    tile_add(industrialbg1,tilewallw*4,bigwallh*irandom(1),bigwallw,bigwallh,dx,dy,vtile.depth+3)
                    tile_add(redbg,0,0,5,5,dx+3,dy,vtile.depth+2)//put a red dot at the end
                    ds_grid_set(vgrid,vx,vy,2)
                    }
                }*/
            }
        //now correct the vx and vy values
        
        if done = 1{
            ds_grid_set(vgrid,vx,vy,2)
            }
        }//end if done = 0
    firstone = 0
    pdir = vdir
    vmade += 1
    }//end while done = 0
    
ds_list_destroy(vlist)



































