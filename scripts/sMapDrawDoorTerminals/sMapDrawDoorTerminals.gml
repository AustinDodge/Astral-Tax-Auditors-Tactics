/// @description sMapDrawDoorTerminals()
/*This script takes the previously located door terminals and puts them on the map.
*/
var vtile,vterminal;
with oMapTile{
    if ds_grid_get(tiletypegrid,mx,my) = 7{//all door terminals
        vtile = id
        vterminal = instance_create(vtile.x,vtile.y,oDoorTerminal)
        vterminal.depth = vtile.depth-4
        //vterminal.depth = -10000
        vterminal.mytile = vtile
        //vtile.elevation += vterminal.obstacleheight
        vtile.myobject = vterminal
        //ds_grid_set(mapheightgrid,vtile.mx,vtile.my,vtile.elevation)
        }
    }
