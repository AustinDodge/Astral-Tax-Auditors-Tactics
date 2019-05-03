/// @description sWallDressingInit()
/*This script performs the necessart initialization for putting in wall dressing, including
adding in grids for the big walls at the start of the lists and converting all non-negative
values in the wall grids to 1s.
*/

var vgrid,vx,vy,px,py,aelevation,pelevation,aelevation,velevation,vtile,i,j,vval;

//first make the grids for the big rear walls
//start with the north wall


aelevation = ceil(maxelevation/4)//get the height of the bigwall
aelevation += 2
aelevation *= 4//convert that to regular wall units

vgrid = ds_grid_create(roomwidth,aelevation)

aelevation = aelevation//the elevation of the tile behind the wall, in this case it is the maxelevation because the bigwals are the maxelevation
pelevation = 0//the elevation of the tile in front of the wall
ds_grid_clear(vgrid,1)

vx = 0
vy = 0
//now set any "wall" cells that aren't displayed to -1

while vx < roomwidth{
    vtile = ds_grid_get(tilegrid,vx,vy)
    if vtile.object_index != oPitTile{
        pelevation = vtile.elevation
        }else{
        pelevation = 1
        }
    if vtile.object_index = oDoorTile{
        pelevation = ds_grid_height(vgrid)
        }
    py = 0
    while py < ds_grid_height(vgrid){
        vval = ds_grid_get(vgrid,vx,py)
        if py <= pelevation{//if the cell is lower than the tile in front, set it to undrawable
            ds_grid_set(vgrid,vx,py,-1)
            }
        py += 1
        }
    vx += 1
    }

ds_list_insert(tilewallsetslist,0,vgrid)//insert the grid into the south-facing wall set list at position 0

vgrid = ds_list_find_value(tilewallsetslist,ds_list_size(tilewallsetslist)-1)//get rid of the wall grid for the boundary wall
ds_grid_destroy(vgrid)
ds_list_delete(tilewallsetslist,ds_list_size(tilewallsetslist)-1)

vgrid = ds_list_find_value(tilewallsetwlist,0)//get rid of the boundary wall
ds_grid_destroy(vgrid)
ds_list_delete(tilewallsetwlist,0)

//now make the east wall
vgrid = ds_grid_create(roomheight,aelevation)

aelevation = aelevation//the elevation of the tile behind the wall, in this case it is the maxelevation because the bigwals are the maxelevation
pelevation = 0//the elevation of the tile in front of the wall
ds_grid_clear(vgrid,1)



vx = roomwidth-1
vy = 0
//now set any "wall" cells that aren't displayed to -1

while vy < roomheight{
    vtile = ds_grid_get(tilegrid,vx,vy)
    if vtile.object_index != oPitTile{
        pelevation = vtile.elevation
        }else{
        pelevation = 1
        }
    if vtile.object_index = oDoorTile{
        pelevation = ds_grid_height(vgrid)
        }
    py = 0
    while py < ds_grid_height(vgrid){
        if py <= pelevation{//if the cell is lower than the tile in front, set it to undrawable
            ds_grid_set(vgrid,vy,py,-1)
            }
        py += 1
        }
    vy += 1
    }
ds_list_add(tilewallsetwlist,vgrid)//insert the grid into the south-facing wall set list at the end


/*We've made wall tile lists for the two big walls. Now go through every wall set list and set every non-negative value to 1.
*/

for(i = 0; i < ds_list_size(tilewallsetslist); i += 1){//correct the south-facing walls
    vgrid = ds_list_find_value(tilewallsetslist,i)
    vx = 0
    vy = 0
    while vy < ds_grid_height(vgrid){
        j = ds_grid_get(vgrid,vx,vy)
        if j >= 0 and j < 10{
            ds_grid_set(vgrid,vx,vy,1)
            }else{
            ds_grid_set(vgrid,vx,vy,-1)
            }
        vx += 1
        if vx = ds_grid_width(vgrid){
            vx = 0
            vy += 1
            }
        }
    }

for(i = 0; i < ds_list_size(tilewallsetwlist); i += 1){//correct the south-facing walls
    vgrid = ds_list_find_value(tilewallsetwlist,i)
    vx = 0
    vy = 0
    while vy < ds_grid_height(vgrid){
        j = ds_grid_get(vgrid,vx,vy)
        if j >= 0 and j < 10{
            ds_grid_set(vgrid,vx,vy,1)
            }else{
            ds_grid_set(vgrid,vx,vy,-1)
            }
        vx += 1
        if vx = ds_grid_width(vgrid){
            vx = 0
            vy += 1
            }
        }
    }

//and we're good to start putting down tiles!
















