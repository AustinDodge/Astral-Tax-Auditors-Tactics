/// @description sMapFindContinuityStartTile()
/*This script finds the blank tile closest to the corner of the map closest to the camera,
closest to grid position 0,roomwidth-1. That is used as the start tile for other djkstra
continuity script for map creation. It must be called after pits are cut.
*/

var vx,vy,howmany;
vx = 0
vy = roomheight-1
vstarttile = 0
howmany = 1
while vstarttile = 0{
    if vx >= 0 and vx < roomwidth and vy >= 0 and vy < roomheight{
        if ds_grid_get(tiletypegrid,vx,vy) = 0{//if it's not a pit
            vstarttile = ds_grid_get(tilegrid,vx,vy)
            }
        }
    vx += 1
    vy += 1
    if vy = roomheight{
        howmany += 1
        vy = roomheight - howmany
        vx = 0
        if howmany > roomheight*2{
            show_message("things got messed up, infinite loop in sMapPlaceElevators!")
            vstarttile = 1
            }
        }
    }
//show_message(vstarttile)
    
