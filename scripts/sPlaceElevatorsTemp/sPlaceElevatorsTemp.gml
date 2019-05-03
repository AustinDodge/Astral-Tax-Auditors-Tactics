/// @description sMapPlaceElevatorsTemp()
/*This script is a placeholder for elevators until I make the proper algorithm. It goes
through the squares of the map checking each tile if it's adjacent to a tile that's more
than three tiles higher and if so, it has a one in two chance of placing an elevator tile
there.
*/
var vx,vy,vheight,cheight,placeone,vtile;
vx = 0
vy = roomheight-1
while vy >= 0{
    placeone = 0
    vheight = ds_grid_get(mapheightgrid,vx,vy)
    if vx+1 < roomwidth{
        cheight = ds_grid_get(mapheightgrid,vx+1,vy)
        if (cheight - vheight) > 2{
            placeone = 1
            }
        }
    if vy+1 < roomheight{
        cheight = ds_grid_get(mapheightgrid,vx,vy+1)
        if (cheight - vheight) > 2{
            placeone = 1
            }
        }
    if vx-1 >= 0{
        cheight = ds_grid_get(mapheightgrid,vx-1,vy)
        if (cheight - vheight) > 2{
            placeone = 1
            }
        }
    if vy-1 >= 0{
        cheight = ds_grid_get(mapheightgrid,vx,vy-1)
        if (cheight - vheight) > 2{
            placeone = 1
            }
        }
    vtile = ds_grid_get(tiletypegrid,vx,vy)
    if vtile > 0{//if it's a door or anything except a blank tile
        placeone = 0
        }
    if placeone = 1{
        if irandom(1) = 0{
            ds_grid_set(tiletypegrid,vx,vy,5)//5 is elevator type
            }
        }
    vx += 1
    if vx = roomwidth{
        vx = 0
        vy -= 1
        }
    }
