/// @description sMakeTileWalls(vmaxelevation)
/// @param vmaxelevation

//this script makes the tile wall grids to be drawn beneath each tile. It does not draw them. It also makes copies of these grids for later use
//in drawing the set decoration.

var vgrid,i,f,g,vmaxelevation,pelevation,aelevation,vx,vy,px,py,agrid,dx,dy,dw,dh,h,altmax,altmin,altwidth,altheight,tgrid,vtile,ptile,atile,velevin,velevout,vcleared,vdiff,j;
//pelevation is the elevation of the tile in front of the wall, aelevation is the height of the tile the wall comes down from
/*
The grid modification bits are different from others in here in that they start with 0,0 representing the bottom left instead of top left
and move up the column instead across the rows. This might be a problem later

-1 is draw nothing
0 is draw wall pattern 1
1 is draw wall pattern 2
etc*/

vmaxelevation = argument0
vmaxelevation += 1
tilewallslist = ds_list_create()
tilewallwlist = ds_list_create()

tilewallsetwlist = ds_list_create()
tilewallsetslist = ds_list_create()

altmax = 20
altmin = 5//the max and min number of alternate tiles on the wall
altwidth = 2
altheight = 3//the max height and width of alt tile blocks

agrid = ds_grid_create(roomwidth*2,vmaxelevation*2)//a temporary grid for drawing patterns on that will be transferred to the real grid

for(i = 0; i < roomheight; i += 1){//make the grids for the south facing walls
    vgrid = ds_grid_create(roomwidth,vmaxelevation)//the actual wall grid
    ds_grid_clear(vgrid,-1)
    
    ds_grid_clear(agrid,0)//clear the temp grid with the base wall type
    h = irandom_range(altmin,altmax)
    if i = roomheight-1{//make the front walls more random
        h = irandom_range(altmin*2,altmax*1.5)
        j = floor((roomwidth*vmaxelevation)/5)
        while j > 0{
            j -= 1
            dx = irandom(roomwidth-1)
            dy = irandom(vmaxelevation-1)
            ds_grid_set(vgrid,dx,dy,1)
            }
        }
    for(f = 0; f <= h; f += 1){//slap some random squares of second type on the temp grid,making sure you don't go out of the bounds of the temp grid
        dx = irandom(roomwidth*2)
        dy = irandom(vmaxelevation*2)
        if dx > 2{
            dx -= 2
            }
        if dy > 2{
            dx -= 2
            }
        dw = irandom_range(1,altwidth)
        dh = irandom_range(1,altheight)
        while dx+dw > (roomwidth*2)-1{
            dw -= 1
            }
        while dy+dh > (vmaxelevation*2)-1{
            dh -= 1
            }
        ds_grid_set_region(agrid,dx,dy,dx+dw,dy+dh,1)
        }
    
    ds_grid_set_grid_region(vgrid,agrid,roomwidth/2,vmaxelevation/2,(roomwidth/2)+roomwidth,(vmaxelevation/2)+vmaxelevation,0,0)
        //copy from the middle of the oversized grid, to make things look more natural 
    if i = roomheight-1{//make the front walls more random
        h = irandom_range(altmin*2,altmax*1.5)
        j = floor((roomwidth*vmaxelevation)/6)
        while j > 0{
            j -= 1
            dx = irandom(roomwidth-1)
            dy = irandom(vmaxelevation-1)
            ds_grid_set(vgrid,dx,dy,2)
            }
        }
        
        
    //the random grid pattern has been drawn, now start cutting out tile that don't need to be drawn.
    px = 0//start clearing the tiles that don't need to be drawn
    py = 0
    vx = 0
    vy = 0
    for (g = 0; g < roomwidth; g += 1){
        velevin = 0
        velevout = 0
        ptile = ds_grid_get(tilegrid,g,i)
        vx = g//debug info
        vy = i//debug
        pelevation = ptile.elevation//start on the 0 x side and move across the y axis to get south facing tiles
        if i+1 < roomheight{
            atile = ds_grid_get(tilegrid,g,i+1)
            aelevation = atile.elevation
            }else{
            atile = -1
            aelevation = 0
            if ptile.object_index = oDoorTile{//don't draw walls for the elevator shaft
                pelevation = 0
                }
            }
        if atile > 0{//if there is a tile in front of the one we're considering, ie if ptile isn't the lowest tile
            if atile.object_index = oPitTile{//draw walls behind pits all the way down
                aelevation = 0
                if ptile.object_index = oDoorTile{//don't draw door walls into pits
                    //pelevation = 0//we're drawing them now
                    }
                }
            if atile.object_index = oDoorTile{
                if ptile.object_index != oDoorTile{
                    velevin = 1
                    if atile.elevation > ptile.elevation{
                        pelevation = atile.elevation
                        }
                    }
                aelevation = 0
                }
            if atile.object_index = oCatwalkTile{//if it's a catwalk tile neighbor, draw the wall.
                aelevation = 0
                }
            }
       
        if ptile.object_index = oDoorTile{
            velev = 1
            if atile > 0{
                if ds_grid_get(walltilegrid,atile.mx,atile.my) = 0{
                    //aelevation = 0
                    }
                if atile.object_index = oDoorTile{
                    aelevation = 0
                    pelevation = 0
                    }else{
                    velevout = 1
                    }
                }                         
            }
        if ds_grid_get(walltilegrid,g,i) = 0{//if the tile shouldn't even have walls drawn
            if i < roomheight-1 and velevin = 0 and velevout = 0{
                pelevation = 0
                }
            }
        //done checking special tile conditions
        for (f = 0; f < ds_grid_height(vgrid); f += 1){
            vcleared = 0

            if f > pelevation{
                ds_grid_set(vgrid,g,f,-1)
                vcleared = 1
                }
            if f <= aelevation{
                ds_grid_set(vgrid,g,f,-1)
                vcleared = 1
                }
            if vcleared = 0{
                if velevin = 1{//if it's an inner elevator tile
                    ds_grid_set(vgrid,g,f,13)
                    }
                if velevout = 1{
                    ds_grid_set(vgrid,g,f,14)
                    }
                }
            }
        }
    vy += 1
    ds_list_add(tilewallslist,vgrid)
    tgrid = ds_grid_create(1,1)//make a copy of the grid and use it later for placing set dressing
    ds_grid_copy(tgrid,vgrid)
    ds_list_add(tilewallsetslist,tgrid)
    }

ds_grid_destroy(agrid)








/*The west facing walls also start at 0,0 on the main map grid, moving backwards towards the east big wall, opposite the south walls.
*/
agrid = ds_grid_create(roomheight*2,vmaxelevation*2)//a temporary grid for drawing patterns on that will be transferred to the real grid

for(i = 0; i < roomwidth; i += 1){//make the grids for the west facing walls
    vgrid = ds_grid_create(roomheight,vmaxelevation)
    ds_grid_clear(vgrid,-1)
    
    ds_grid_clear(agrid,0)//clear the temp grid with the base wall type
    h = irandom_range(altmin,altmax)
    if i = 0{//make the front walls more random
        h = irandom_range(altmin*2,altmax*1.5)
        j = floor((roomheight*vmaxelevation)/5)
        while j > 0{
            j -= 1
            dx = irandom(roomheight-1)
            dy = irandom(vmaxelevation-1)
            ds_grid_set(vgrid,dx,dy,1)
            }
        }
    for(f = 0; f <= h; f += 1){//slap some random squares of second type on the temp grid,making sure you don't go out of the bounds of the temp grid
        dx = irandom(roomheight*2)
        dy = irandom(vmaxelevation*2)
        if dx > 2{
            dx -= 2
            }
        if dy > 2{
            dy -= 2
            }
        dw = irandom_range(1,altwidth)
        dh = irandom_range(1,altheight)
        while dx+dw > (roomheight*2)-1{
            dw -= 1
            }
        while dy+dh > (vmaxelevation*2)-1{
            dh -= 1
            }
        ds_grid_set_region(agrid,dx,dy,dx+dw,dy+dh,1)
        }
    ds_grid_set_grid_region(vgrid,agrid,roomheight/2,vmaxelevation/2,(roomheight/2)+roomheight,(vmaxelevation/2)+vmaxelevation,0,0)
        //copy from the middle of the oversized grid, to make things look more natural 
    if i = 0{//make the front walls more random
        j = floor((roomheight*vmaxelevation)/6)
        while j > 0{
            j -= 1
            dx = irandom(roomheight-1)
            dy = irandom(vmaxelevation-1)
            ds_grid_set(vgrid,dx,dy,2)
            }
        }
    for (g = 0; g < roomheight; g += 1){
        velevin = 0
        velevout = 0
        ptile = ds_grid_get(tilegrid,i,g)
        vx = i//debug info
        vy = g//debug
        pelevation = ptile.elevation//start on the 0 x side and move across the y axis to get south facing tiles
        if i-1 > 0{
            atile = ds_grid_get(tilegrid,i-1,g)
            aelevation = atile.elevation
            }else{
            atile = -1
            aelevation = 0
            if ptile.object_index = oDoorTile{//don't draw walls for the elevator shaft
                pelevation = 0
                }
            }
        if atile > 0{//if there is a tile in front of the one we're considering, ie if ptile isn't the lowest tile
            if atile.object_index = oPitTile{//draw walls behind pits all the way down
                aelevation = 0
                if ptile.object_index = oDoorTile{//don't draw door walls into pits
                    //pelevation = 0//we're drawing them now
                    }
                }
            if atile.object_index = oDoorTile{
                 if ptile.object_index != oDoorTile{
                    velevin = 1
                    if atile.elevation > ptile.elevation{
                        pelevation = atile.elevation
                        }
                    }
                 aelevation = 0
                }
            if atile.object_index = oCatwalkTile{//if it's a catwalk tile neighbor, draw the wall.
                aelevation = 0
                }
            }
       
        if ptile.object_index = oDoorTile{
            velev = 1
            if atile > 0{
                if ds_grid_get(walltilegrid,atile.mx,atile.my) = 0{
                    //aelevation = 0
                    }
                if atile.object_index = oDoorTile{
                    aelevation = 0
                    pelevation = 0
                    }else{
                    velevout = 1
                    }
                }                         
            }
        if ds_grid_get(walltilegrid,i,g) = 0{//if the tile shouldn't even have walls drawn
            if i > 0 and velevin = 0 and velevout = 0{
                pelevation = 0
                }
            }
        //done checking special tile conditions
        for (f = 0; f < ds_grid_height(vgrid); f += 1){
            vcleared = 0
            
            if f > pelevation{
                ds_grid_set(vgrid,g,f,-1)
                vcleared = 1
                }
            if f <= aelevation{
                ds_grid_set(vgrid,g,f,-1)
                vcleared = 1
                }
            if vcleared = 0{
                if velevin = 1{//if it's an inner elevator tile
                    ds_grid_set(vgrid,g,f,13)
                    }
                if velevout = 1{
                    ds_grid_set(vgrid,g,f,14)
                    }
                }
            
            }
        }
    ds_list_add(tilewallwlist,vgrid)
    tgrid = ds_grid_create(1,1)//make a copy of the grid and use it later for placing set dressing
    ds_grid_copy(tgrid,vgrid)
    ds_list_add(tilewallsetwlist,tgrid)
    }
    
ds_grid_destroy(agrid)
