//this script also makes elevators

with oMapTile{
    y -= (elevation*elevheight)
    /*if ds_grid_get(tiletypegrid,mx,my) = 5{//if it should be an elevator
        var vtile;
        vtile = instance_create(x,y,oElevatorTile)
        vtile.depth = depth
        vtile.mx = mx
        vtile.my = my
        vtile.elevation = elevation
        vtile.lowelevation = elevation
        vtile.topelevation = elevation+4//placeholder amount to test
        ds_grid_set(tilegrid,mx,my,vtile)
        instance_destroy()
        }*/
    }
