//request the new window height and width, and resize the window to that size
var vwidth,vheight,vwidthmin,vheightmin;

vwidthmin = 400
vheightmin = 400

vwidth = get_integer("New window width? Minimum "+string(vwidthmin),400)
if vwidth < vwidthmin{
	vwidth = vwidthmin
	}
vheight = get_integer("New window height? Minimum "+string(vheightmin), 400)
if vheight < vheightmin{
	vheight = vheightmin
	}
	
sCameraChangeResolution(vwidth,vheight,0)