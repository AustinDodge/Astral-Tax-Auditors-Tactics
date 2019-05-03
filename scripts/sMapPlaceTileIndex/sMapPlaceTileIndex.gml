/// @description sMapPlaceTileIndex()
/*this script places numbers on the tileindexgrid showing non-special tiles what
image index they should use. Strictly cosmetic.
*/

var maxindex,nochangechance,i,vx,vy,didit,j;
maxindex = 2//the number of index choices in the base tile
nochangechance = 7//each tile has a (nochangechance-1)/nochangechance to not change.
//Lower number means more special tiles
for (i = 1; i <= maxindex; i += 1){
    vx = 0
    vy = 0
    while vy < roomheight{
        j = ds_grid_get(tileindexgrid,vx,vy)
        if j = 0{
            if irandom(nochangechance) = 1{
                ds_grid_set(tileindexgrid,vx,vy,i)
                }
            }
        vx += 1
        if vx = roomwidth{
            vx = 0
            vy += 1
            }
        }
    }
