var vtile,atile,velev;

with oDoorTile{
    mydoorpit = instance_create(x,y,oDoorPit)
    vtile = mydoorpit
    vtile.depth = depth+2
    velev = 4
    vtile.bordern = 0
    vtile.bordere = 0
    //if elevation > 8{
        //velev = elevation - 5
        //}
    vtile.elevation = velev
    vtile.y += ((elevation-velev)*elevheight)
    if sIsTileLocationValid(mx,my-1){
        atile = ds_grid_get(tilegrid,mx,my-1)
        if atile.object_index != oDoorTile{
            vtile.bordern = 1
            }
        }else{
        vtile.bordern = 1
        }
    if sIsTileLocationValid(mx+1,my){
        atile = ds_grid_get(tilegrid,mx+1,my)
        if atile.object_index != oDoorTile{
            vtile.bordere = 1
            }
        }else{
        vtile.bordere = 1
        }
    }
