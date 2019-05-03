/// @description sCenterCameraOnMap()

/*this script centers the camera on the tiles - all tiles average their x and y
values and the camera is put at that average.
*/

var midx,midy;

midx = 0
midy = 0

with oMapTile{
    midx += x
    midy += y
    }
midx = round(midx/instance_number(oMapTile))
midy = round(midy/instance_number(oMapTile))

oCamera.x = midx
oCamera.y = midy

//oCamera.x = mapdrawingstartx
//oCamera.y = mapdrawingstarty
