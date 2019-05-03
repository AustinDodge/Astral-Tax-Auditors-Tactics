/// @description sMapMakePits()
/*This script cuts out sections from the map to make bottomless pits, while retaining
a path from the start door to the end door, and in the future will also include "islands"
where certain important map objects may be located.
*/

var pitamount,pitsizemax,pitsizemin,cuttilegrid,vgrid,i,vpitwidth,vpitheight,vx,vy,vstart,vend,
startdir,startlist,endlist,starttile,endtile,vtile,vlist;

cuttilegrid = ds_grid_create(roomwidth,roomheight)//the grid that contains the tiles proposed to be cut
vgrid = ds_grid_create(roomwidth*2,roomheight*2)//temp grid for sketching the cuts on
startlist = ds_list_create()
endlist = ds_list_create()
if maptype = 0{//if making cavern type map
    ds_grid_clear(vgrid,1)
    //pitsizemax = floor(mean(roomwidth,roomheight)/2)//the maximum size of a side of a pit
    pitsizemax = 5
    pitsizemin = 3//the minimum size of a side of a pit
    pitamount = 3//how many pits to put on the grid
    
    for(i = 0; i < pitamount; i += 1){
        vx = irandom((roomwidth*2)-1)
        vy = irandom((roomheight*2)-1)
        vpitwidth = irandom_range(pitsizemin,pitsizemax)
        vpitheight = irandom_range(pitsizemin,pitsizemax)
        if (vx+vpitwidth < roomwidth*2) and (vy+vpitheight < roomheight*2){//if the square won't go out of grid
            ds_grid_set_region(vgrid,vx,vy,vx+vpitwidth,vy+vpitheight,0)
            }else{
            if (vx-vpitwidth >= 0) or (vy-vpitheight >= 0) {
                ds_grid_set_region(vgrid,vx-vpitwidth,vy-vpitheight,vx,vy,0)
                }else{
                show_message("somehow a pit was too big to fit in the map at all!")//debug
                i -= 1//retry to insert the pit
                }
            }
        }
    
    vx = floor(roomwidth/2)
    vy = floor(roomheight/2)
    ds_grid_set_grid_region(cuttilegrid,vgrid,vx,vy,vx+roomwidth,vy+roomheight,0,0)
    }
if maptype = 1{//if making catwalk type map
    ds_grid_clear(cuttilegrid,0)
    }
ds_grid_destroy(vgrid)
//Created cuts

vx = 0
vy = 0
while vy < roomheight{
    if (ds_grid_get(cuttilegrid,vx,vy) = 0) and (ds_grid_get(savetilegrid,vx,vy) = 0){//if both are 0,
        //temp script to lower all elevations
        //ds_grid_set(mapheightgrid,vx,vy,0)
        vtile = ds_grid_get(tilegrid,vx,vy)
        //vtile.elevation = 0
        sTilePitChange(vtile)
        }
    vx += 1
    if vx = roomwidth{
        vx = 0
        vy += 1
        }
    }
    
var vmin,vdone;
vmin = 100
with oPitTile{//set high to lower later
    elevation = 100
    }
with oPitTile{//have each group of pit tiles go to the lowest tile in their "group"
    vmin = 100
    if n > 0{//if there's a north tile
        if n.object_index != oPitTile{
            bordern = 1
            vmin = n.elevation
            }
        }
    if e > 0{
        if e.object_index != oPitTile{
            bordere = 1
            if e.elevation < vmin{
                vmin = e.elevation
                }
            }
        }
    if s > 0{
        if s.object_index != oPitTile{
            borders = 1
            if s.elevation < vmin{
                vmin = s.elevation
                }
            }
        }
    if w > 0{
        if w.object_index != oPitTile{
            borderw = 1
            if w.elevation < vmin{
                vmin = w.elevation
                }
            }
        }
    if vmin < elevation{
        elevation = vmin
        }
    }


//now loop through all the pittiles until they're all at their groups lowest elevation

vdone = 0
vlist = ds_list_create()
while vdone = 0{
    
    vdone = 1
    with oPitTile{
        ds_list_clear(vlist)
        ds_list_add(vlist,n)
        ds_list_add(vlist,e)
        ds_list_add(vlist,s)
        ds_list_add(vlist,w)
        while ds_list_size(vlist) > 0{
            vtile = ds_list_find_value(vlist,0)
            if vtile > 0{
                if vtile.object_index = oPitTile{
                    if vtile.elevation < elevation{
                        elevation = vtile.elevation
                        vdone = 0
                        }
                    }
                }
            ds_list_delete(vlist,0)
            }
        }
    }
with oPitTile{
    ds_grid_set(mapheightgrid,mx,my,elevation)
    }

ds_list_destroy(vlist)    
ds_grid_destroy(cuttilegrid)
ds_list_destroy(startlist)
ds_list_destroy(endlist)






















