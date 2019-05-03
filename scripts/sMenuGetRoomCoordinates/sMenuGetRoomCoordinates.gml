/// @description sMenuGetRoomCoordinates(xoff,yoff)
/// @param xoff
/// @param yoff
/*sets the x and y coordinates of a menu object after dimensions are set. Find the
x and y coordinates of the center of the current view, and subtract half the height
and width of the menu object.
*/

var midx,midy,halfwidth,halfheight,xoff,yoff;

xoff = argument0//the offset from the center in pixels of the menu object
yoff = argument1

midx = round(__view_get( e__VW.XView, 0 ) + (camrealwidth/2))
midy = round(__view_get( e__VW.YView, 0 ) + (camrealheight/2))

midx += xoff
midy += yoff

halfwidth = round(menuwidth/2)
halfheight = round(menuheight/2)

x = midx - halfwidth
y = midy - halfheight
