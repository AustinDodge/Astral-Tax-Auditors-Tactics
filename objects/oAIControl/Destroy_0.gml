aialldone = 1

ds_list_destroy(unitlist)
ds_list_destroy(doneunitlist)
ds_priority_destroy(unitmovepriority)
ds_grid_destroy(kdamagegrid)
ds_grid_destroy(edamagegrid)
ds_grid_destroy(sdamagegrid)
ds_grid_destroy(roompathgrid)
var i,vgrid;
for(i = 0; i < ds_list_size(dmaplist); i += 1){
    vgrid = ds_list_find_value(dmaplist,i)
    if ds_exists(vgrid,ds_type_grid){
        ds_grid_destroy(vgrid)
        }
    }
ds_list_destroy(dmaplist)
ds_list_destroy(dmapindexlist)

ds_map_destroy(knockbarrelmap)
ds_map_destroy(destroybarrelmap)
ds_list_destroy(obstacleunitslist)
ds_map_destroy(obstacleunitmap)

sPlayerChangePlayer()

