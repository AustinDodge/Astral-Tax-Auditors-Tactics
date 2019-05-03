/// @description sTileFindNeighbors()

//this script finds each tiles neighboring tiles

with oMapTile{
    if my > 0{
        n = ds_grid_get(tilegrid,mx,my-1)
        }
    if mx < ds_grid_width(tilegrid)-1{
        e = ds_grid_get(tilegrid,mx+1,my)
        }
    if my < ds_grid_height(tilegrid)-1{
        s = ds_grid_get(tilegrid,mx,my+1)
        }
    if mx > 0{
        w = ds_grid_get(tilegrid,mx-1,my)
        }
    }
    

