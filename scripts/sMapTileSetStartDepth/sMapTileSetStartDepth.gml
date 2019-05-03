/// @description sMapTileSetStartDepth()

/*This script sets the proper depth of each tile, starting at
roomwidth-1,0 and proceeding down the y axis. Each step vdepth has
10 subtracted from it. When it reached the height of the room, go to roomwidth-2,0 and
start over. This puts each tile at a different depth to prevent drawing conflicts.
*/
var vx,vy,vdepth,vtile;

/*vdepth = 0

vx = roomwidth-1
vy = 0

while vx >= 0{
    vtile = ds_grid_get(tilegrid,vx,vy)
    vtile.depth = vdepth
    vdepth -= 10
    vy += 1
    if vy = roomheight{
        vy = 0
        vx -= 1
        }
    }
    
/*Now try a different method of setting the depths - create a second grid that's effectively a rotated tilegrid,
so that the tile closest to the front of the room is at 0,0 rather than roomheight,0. Then each tile gets its position
on that grid, and its depth is (xpos+ypos)10. Rotate the grid once clockwise.*/

var bx,by,vgrid,vwidth,vheight;
vwidth = roomheight
vheight = roomwidth
vgrid = ds_grid_create(vwidth,vheight)
bx = vwidth-1//in the second grid, roomwidth is vheight and roomheight is vwidth
by = 0
vx = 0
vy = 0

while vy < roomheight{
    vtile = ds_grid_get(tilegrid,vx,vy)
    ds_grid_set(vgrid,bx,by,vtile)
    vx += 1
    by += 1
    if vx >= roomwidth{
        vx = 0
        vy += 1
        by = 0
        bx -= 1
        }
    }
//vgrid is now a rotated tilegrid.
with oMapTile{
    vx = ds_grid_value_x(vgrid,0,0,vwidth-1,vheight-1,id)
    vy = ds_grid_value_y(vgrid,0,0,vwidth-1,vheight-1,id)
    depth = ((vx+vy)*10)
    vdepth = depth
    }

ds_grid_destroy(vgrid)































