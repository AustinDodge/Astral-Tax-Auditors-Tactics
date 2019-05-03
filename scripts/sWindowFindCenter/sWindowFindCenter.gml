///sWindowFindCenter()
/*ran by an interface object to find the center of the current view, and set its own x/y coordinates to
that center position. Then calculate what that position is relative to the camera so that position can
be maintained if the camera moves.
*/

var midx,midy,vwidth,vheight;

midx = camera_get_view_x(maincameraid) + round(camrealwidth/2)
midy = camera_get_view_y(maincameraid) + round(camrealheight/2)

vwidth = round(sprite_width/2)
vheight = round(sprite_height/2)

x = midx - vwidth
y = midy - vheight

mxoff = x - camera_get_view_x(maincameraid)
myoff = y - camera_get_view_y(maincameraid)
