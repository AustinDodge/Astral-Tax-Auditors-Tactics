/// @description sMapMakeKeyTileIslands(minsize,maxsize,maxoffset)
/// @param minsize
/// @param maxsize
/// @param maxoffset
/*This script creates "islands" around the key tiles set earlier in the script then
transfers them to tiletypegrid as regular tiles. A series of squares are made of
varying sizes around the center, which is a random number of tiles away from the keytile
capped at maxoffset. Those squares are put on tiletypegrid as 0, unless there's already
something greater than 0 in that cell.
*/
var minsize,maxsize,maxoffset,vgrid,startx,starty,gridstartx,gridstarty,vx,vy,bx,by,i,j,xcenter,ycenter,howmany,xlength,ylength,ex,ey;

minsize = argument0
maxsize = argument1
maxoffset = argument2

vgrid = ds_grid_create(maxsize*3,maxsize*3)

for(i = 0; i < ds_list_size(keytilelist); i += 1){//make an island for each key tile
    vtile = ds_list_find_value(keytilelist,i)//the tile the island will surround
    
    ds_grid_clear(vgrid,0)
    xcenter = round(maxsize*1.5)
    ycenter = round(maxsize*1.5)
    xcenter += irandom_range(0-maxoffset,maxoffset)
    ycenter += irandom_range(0-maxoffset,maxoffset)
    xlength = irandom_range(minsize,maxsize)
    ylength = irandom_range(minsize,maxsize)
    startx = xlength/2
    starty = ylength/2
    if xlength/2 != floor(xlength/2){//if it's not an even number
        switch irandom(1){
            case 0: startx = floor(xlength/2); break;
            case 1: startx = ceil(xlength/2); break;
            }
        }
    if ylength/2 != floor(ylength/2){
        switch irandom(1){
            case 0: starty = floor(ylength/2); break;
            case 1: starty = ceil(ylength/2); break;
            }
        }
    ds_grid_set_region(vgrid,xcenter-startx,ycenter-starty,xcenter+starty,ycenter+starty,1)
    howmany = irandom_range(2,5)
    for(j = 0; j < howmany; j += 1){
        xlength = irandom_range(minsize,maxsize)
        ylength = irandom_range(minsize,maxsize)
        if xlength/2 != floor(xlength/2){//if it's not an even number
            switch irandom(1){
                case 0: startx = floor(xlength/2); break;
                case 1: startx = ceil(xlength/2); break;
                }
            }
        if ylength/2 != floor(ylength/2){
            switch irandom(1){
                case 0: starty = floor(ylength/2); break;
                case 1: starty = floor(ylength/2); break;
                }
            }
        vx = irandom(xlength)
        vy = irandom(ylength)
        bx = xlength-vx
        by = ylength - vy
        ds_grid_set_region(vgrid,xcenter-vx,ycenter-vy,xcenter+bx,ycenter+by,1)
        }
    //vgrid has been populated with a randomly shaped island, now transfer that to tiletypegrid and savetilegrid
    //start by finding the relative positions of the island grid over the main grid
    bx = xcenter
    by = ycenter
    vx = vtile.mx
    vy = vtile.my
    gridstartx = vx - bx
    gridstarty = vy - by
    
    bx = gridstartx//the position on the main grids
    by = gridstarty
    
    vx = 0//the position on the island grid
    vy = 0
    while vy < ds_grid_height(vgrid){//loop to copy tiles
        if bx >= 0 and by >= 0{
            if bx < roomwidth and by < roomheight{//make sure they're valid cells
                j = ds_grid_get(vgrid,vx,vy)
                if j = 1{
                    //ds_grid_set(tiletypegrid,bx,by,0)//set to regular tile
                    ds_grid_set(savetilegrid,bx,by,1)//save this tile
                    ds_grid_set(tileindexgrid,bx,by,0)//debug
                    if irandom(8) = 1{
                        switch irandom(1){
                            case 1: ds_grid_set(tileindexgrid,bx,by,1); break;
                            case 2: ds_grid_set(tileindexgrid,bx,by,2); break;
                            }
                        }
                    }
                }
            }
        vx += 1
        bx += 1
        if vx >= ds_grid_width(vgrid){
            vx = 0
            bx = gridstartx
            vy += 1
            by += 1
            }
        }
        
    }//end main for loop

ds_grid_destroy(vgrid)






























