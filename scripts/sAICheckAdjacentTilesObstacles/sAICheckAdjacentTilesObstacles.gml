/// @description sAICheckAdjacentTilesObstacles(vtile,vgrid)
/// @param vtile
/// @param vgrid
/*This script takes a tile as an argument and checks if any of the adjacent tiles have an
obstacle on them(crate, barrel, etc) and if so, if that tile is the next step on the path
to getting to the player units. If that tile has a lower cost than the tile being checked,
than whatever's in that tile must be an obstacle due to the costs set while making the dmaps.
It returns that tile, or if there is no obstacle, returns -1.
*/
var vtile,vgrid,btile,ctile,vcost,checkcost,bunit,vlist;

vtile = argument0
vgrid = argument1
checkcost = ds_grid_get(vgrid,vtile.mx,vtile.my)
btile = 0
ctile = -1

vlist = ds_list_create()//populate with the adjacent tiles
if sIsTileLocationValid(vtile.mx,vtile.my-1){
    ds_list_add(vlist,ds_grid_get(tilegrid,vtile.mx,vtile.my-1))
    }
if sIsTileLocationValid(vtile.mx+1,vtile.my){
    ds_list_add(vlist,ds_grid_get(tilegrid,vtile.mx+1,vtile.my))
    }
if sIsTileLocationValid(vtile.mx,vtile.my+1){
    ds_list_add(vlist,ds_grid_get(tilegrid,vtile.mx,vtile.my+1))
    }
if sIsTileLocationValid(vtile.mx-1,vtile.my){
    ds_list_add(vlist,ds_grid_get(tilegrid,vtile.mx-1,vtile.my))
    }
//vlist is now populated with the valid adjacent tiles
while ds_list_size(vlist) > 0{
    btile = ds_list_find_value(vlist,0)
    ds_list_delete(vlist,0)
    if btile.occupied > 0{
        bunit = btile.occupied
        if bunit.team > 2{
            vcost = ds_grid_get(vgrid,btile.mx,btile.my)
            if vcost < checkcost{
                //if it costs less to get to this tile it must be in the way(or the path around it is very long)
                ctile = btile
                }
            }
        }
    }
    
ds_list_destroy(vlist)
    
return ctile;
    

