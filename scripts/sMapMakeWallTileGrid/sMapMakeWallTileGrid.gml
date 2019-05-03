/// @description sMapMakeWallTileGrid()
/*This script has every tile that should have walls drawn put a 1 on walltilegrid.
Walltilegrid is used in sMakeTileWalls to draw walls only for tiles that should have
them - i.e, no pits, catwalks, etc
*/
ds_grid_clear(walltilegrid,0)
with oMapTile{
    if object_index = oMapTile or object_index = oDoorTile or object_index = oElevatorTile{
        ds_grid_set(oMapControl.walltilegrid,mx,my,1)
        }
    }
