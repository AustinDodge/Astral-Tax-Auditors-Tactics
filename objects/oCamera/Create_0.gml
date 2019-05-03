globalvar viewdiv,canmovecamera,camrealwidth,camrealheight;

maincameraid = view_camera[0]

canmovecamera = 1//set to 0 when the program takes control of the camera

canchangezoom = 1//if the user can change zoom with mouse wheel, for debug

camera_set_view_size(maincameraid,gdisplaywidth,gdisplayheight)

//wreal and hreal are the size everything is drawn at, wsize/hsize are the size it's stretched to in the display
wreal = camera_get_view_width(maincameraid)
hreal = camera_get_view_height(maincameraid)


halfvieww = 0//subtract these from camera x and y to get the position of the view
halfviewh = 0

viewdiv = 3//the amount by which to multiply the pixel size

wsize = ceil(wreal/viewdiv)//the resolution at which the game will be drawn
hsize = ceil(hreal/viewdiv)

xborder = 0//if a unit is this close to the x and y positions, the camera can consider the target reached.
yborder = 0//Set by other objects that are moving the camera.

targetx = 0
targety = 0

camera_set_view_size(maincameraid,wsize,hsize)


camrealwidth = wsize//the width and height of the unstretched view surface
camrealheight = hsize

cameratargeting = 0//if the camera is being moved by another object to a particular target

targetspeed = 6//the speed that the camera moves towards a target

/*var i;
i = 2
while i < wsize{
    i *= 2
    }
wsurfacesize = i//the size of the surface

i = 2
while i < hsize{
    i *= 2
    }
hsurfacesize = i//the size of the surface
*/

//halfvieww = round(wsize/2)
//halfviewh = round(hsize/2)
halfvieww = round(wreal/2)
halfviewh = round(hreal/2)


tsurface = -1

targetx = x+halfvieww
targety = y+halfviewh

takescreenshot = 0
takevid = 0

/* */
/*  */
