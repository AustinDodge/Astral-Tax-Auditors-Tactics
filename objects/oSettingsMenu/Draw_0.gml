//draw_set_color(menucolor)
//draw_set_alpha(menuopacity)
//draw_rectangle(x,y,x+menuwidth,y+menuheight,0)

var vsurface;
with gnoise{
    vsurface = sGNoiseDraw()
    }
draw_surface_ext(vsurface,x,y,1,1,0,c_white,0.5)

draw_set_color(c_white)
draw_set_alpha(1)

