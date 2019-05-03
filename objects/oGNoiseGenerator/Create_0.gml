
mainsurface = -1//the surface that is drawn to the screen
tsurface = -1//the surface that is used to generate noise
backsurface = -1//the solid background surface drawn behind the noise

width = 0//the width of the final drawn noise
height = 0//same

subheight = 0//the height and width of the start shape
subwidth = 0

iterations = 10

shapexlist = ds_list_create()//the coordinates and sizes of the shapes drawn
shapeylist = ds_list_create()
shapeheightlist = ds_list_create()
shapewidthlist = ds_list_create()

multiplescale = 1//the amount to upsize each time
shapedensity = 2//how many shapes to draw

