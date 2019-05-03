/// @description sIsTileLocationValid(x,y)
/// @param x
/// @param y
/*This script takes an x and y location and checks of those coordinates are within the
limits of the map grid. Returns 1 if yes and 0 if no.
*/
var vx,vy,valid;
vx = argument0
vy = argument1
valid = 0
if vx >= 0 and vx < roomwidth{
    if vy >= 0 and vy < roomheight{
        valid = 1
        }
    }

return valid;
