/// @description sMapFloorDressingInit()
/*This script creates the data grid showing if a tile has a dressing on it(or is ineligible
for dressing) or not.
*/

var vgrid;
floordressinggrid = ds_grid_create(roomwidth,roomheight)
ds_grid_clear(floordressinggrid,0)
vgrid = floordressinggrid
//if a tile isn't a standard floor tile, or has an obstacle on it, it's ineligible.
with oMapTile{
    if ds_grid_get(tiletypegrid,mx,my) != 0{
        ds_grid_set(vgrid,mx,my,1)
        }
    if object_index != oMapTile{
        ds_grid_set(vgrid,mx,my,1)
        }
    if myobject > 0{
        ds_grid_set(vgrid,mx,my,1)
        }
    }
