/// @description sCameraChangeResolution(w,h,fullscreen?)
/// @param w
/// @param h
/// @param fullscreen?
/*changes the size of the view and all associated variables
*/

var vwidth,vheight,vfullscreen;
vwidth = argument0
vheight = argument1
vfullscreen = argument2


with oCamera{

	window_set_size(vwidth,vheight)
	surface_resize(application_surface,vwidth,vheight)
	view_wport[0] = vwidth
	view_hport[0] = vheight
	camera_set_view_size(maincameraid,vwidth,vheight)
    
    
    window_set_fullscreen(vfullscreen)
    
    wreal = camera_get_view_width(maincameraid)//the actual size of the view
    hreal = camera_get_view_height(maincameraid)
    
    halfvieww = 0//subtract these from camera x and y to get the position of the view
    halfviewh = 0
    
    //viewdiv = 3//the amount by which to multiply the pixel size
    
    wsize = ceil(wreal/viewdiv)//the resolution at which the game will be drawn
    hsize = ceil(hreal/viewdiv)
    
    xborder = 0//if a unit is this close to the x and y positions, the camera can consider the target reached.
    yborder = 0//Set by other objects that are moving the camera.
    
    targetx = 0
    targety = 0
    
	camera_set_view_size(maincameraid,wsize,hsize)
    
    
    camrealwidth = wsize
    camrealheight = hsize
    
    
    
    halfvieww = round(wreal/2)
    halfviewh = round(hreal/2)
    
    if surface_exists(tsurface){
        surface_resize(tsurface,camera_get_view_width(maincameraid),camera_get_view_height(maincameraid))
        }
    view_visible[0] = 1
	
	view_xport[0] = 0
	view_yport[0] = 0
    }
    
gdisplayheight = vwidth
gdisplayheight = vheight

with oMenuParent{
	sMenuGetRoomCoordinates(0,0)
	}
