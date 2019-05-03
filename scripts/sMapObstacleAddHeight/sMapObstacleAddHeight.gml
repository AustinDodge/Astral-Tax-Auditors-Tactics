/// @description sMapObstacleAddHeight()
/*This script is run towards the end of the map creation process, giving all tiles
with obstacles on them the height of the obstacles. The height isn't added on till the end
so that walls are drawn properly.
*/

with oMapTile{
    if myobject > 0{
        elevation += myobject.obstacleheight
        }
    }
