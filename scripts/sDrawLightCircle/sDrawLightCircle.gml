/// @description sDrawLightCircle(x,y,alpha,color)
/// @param x
/// @param y
/// @param alpha
/// @param color
/*this script draws a circle of a pure color/alpha, then surrounds it with a ring that fades away. The vectors for the points of the circles
are determined in sMakeLightCirclePoints.
*/

var vx,vy,px,py,pradius,fradius,alpha,vcolor,csides,deg,i,vdir,purelength,fadelength,cir1list,cir2list,vsize,fadecolor,fadealpha;

vx = argument0
vy = argument1
alpha = argument2
vcolor = argument3

cir1list = circle1list
cir2list = circle2list

fadecolor = vcolor//black to test draw
fadealpha = 0

csides = 16
deg = 359/csides

csides += 1

draw_set_color(vcolor)
draw_set_alpha(alpha)
vdir = 0
//find the points for the circles

//now draw the "pure" circle
draw_primitive_begin(pr_trianglefan)
draw_vertex_colour(vx,vy,vcolor,alpha)
vsize = ds_list_size(cir1list)
for(i = 0; i < vsize; i += 1){
    px = ds_list_find_value(cir1list,i)
    px += vx
    i += 1
    py = ds_list_find_value(cir1list,i)
    py += vy
    draw_vertex_color(px,py,vcolor,alpha)
    }
draw_primitive_end()

//now draw the fade circle
draw_primitive_begin(pr_trianglestrip)
for(i = 0; i < vsize; i += 1){
    px = ds_list_find_value(cir1list,i)
    px += vx
    i += 1
    py = ds_list_find_value(cir1list,i)
    py += vy
    draw_vertex_colour(px,py,vcolor,alpha)
    px = ds_list_find_value(cir2list,i-1)
    px += vx
    py = ds_list_find_value(cir2list,i)
    py += vy
    //draw_vertex_color(px,py,fadecolor,fadealpha)
    draw_vertex_color(px,py,vcolor,fadealpha)
    }
draw_primitive_end()

draw_set_alpha(1)
draw_set_color(c_white)



