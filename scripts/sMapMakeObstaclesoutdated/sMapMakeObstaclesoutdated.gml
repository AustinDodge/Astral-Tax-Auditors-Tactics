/// @description sMapMakeObstacles()
/*This script places obstacles on the map that impede movement of units. The location is
determined in an earlier called script, sMapPlaceObstacles
*/
var frequency,vtile,vobstacle,vlist,howmany,vterminal;

with oMapTile{
    if ds_grid_get(tiletypegrid,mx,my) = 6{//if it's a regular tile
        vtile = id
        vobstacle = instance_create(vtile.x,vtile.y,oObstacle)
        vobstacle.depth = vtile.depth-4
        vobstacle.mytile = vtile
        vtile.myobject = vobstacle
        //vtile.elevation += vobstacle.obstacleheight
        //ds_grid_set(mapheightgrid,vtile.mx,vtile.my,vtile.elevation)
        }
    }
//now place previously located door terminals
with oMapTile{
    if ds_grid_get(tiletypegrid,mx,my) = 7{//all door terminals
        vtile = id
        vterminal = instance_create(vtile.x,vtile.y,oDoorTerminal)
        vterminal.depth = vtile.depth-1
        //vterminal.depth = -10000
        vterminal.mytile = vtile
        //vtile.elevation += vterminal.obstacleheight
        vtile.myobject = vterminal
        //ds_grid_set(mapheightgrid,vtile.mx,vtile.my,vtile.elevation)
        }
    }
                            
                
