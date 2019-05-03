/// @description sWallDressingConclude()
/*This script finished the wall set dressing, destroying all data structures made during initialization.
*/

var vgrid,vx,vy,px,py,aelevation,pelevation,aelevation,velevation,vtile,i,j;


//start deleting stuff
while ds_list_size(tilewallsetwlist) > 0{
    vgrid = ds_list_find_value(tilewallsetwlist,0)
    ds_list_delete(tilewallsetwlist,0)
    ds_grid_destroy(vgrid)
    }
ds_list_destroy(tilewallsetwlist)

while ds_list_size(tilewallsetslist) > 0{
    vgrid = ds_list_find_value(tilewallsetslist,0)
    ds_list_delete(tilewallsetslist,0)
    ds_grid_destroy(vgrid)
    }
ds_list_destroy(tilewallsetslist)


//aaaaaand its gone












