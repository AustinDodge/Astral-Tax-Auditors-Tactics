/// @description sDrawLightCircle(x,y,pureradius,faderadius,alpha,color)
/// @param x
/// @param y
/// @param pureradius
/// @param faderadius
/// @param alpha
/// @param color
/*this script draws a circle of a pure color/alpha, then surrounds it with a ring that fades away.
*/

var vx,vy,px,py,pradius,fradius,alpha,vcolor,csides,deg,i,vdir,purelength,fadelength,cir1list,cir2list,vsize,fadecolor,fadealpha;

vx = argument0
vy = argument1
pradius = argument2
fradius = argument3 + argument2
alpha = argument4
vcolor = argument5

cir1list = ds_list_create()
cir2list = ds_list_create()

fadecolor = vcolor//black to test draw
fadealpha = 0

csides = 16
deg = 359/csides

csides += 1

draw_set_color(vcolor)
draw_set_alpha(alpha)
vdir = 0
//find the points for the circles
for(i = 0; i < csides; i += 1){
    if i = csides-1{//make sure it ends where it started
        vdir = 0
        }
    px = vx + lengthdir_x(pradius,vdir)
    py = vy + lengthdir_y(pradius,vdir)
    ds_list_add(cir1list,px)
    ds_list_add(cir1list,py)
    px = vx + lengthdir_x(fradius,vdir)
    py = vy + lengthdir_y(fradius,vdir)
    ds_list_add(cir2list,px)
    ds_list_add(cir2list,py)
    vdir += deg
    }
//now draw the "pure" circle
draw_primitive_begin(pr_trianglefan)
draw_vertex_colour(vx,vy,vcolor,alpha)
vsize = ds_list_size(cir1list)
for(i = 0; i < vsize; i += 1){
    px = ds_list_find_value(cir1list,i)
    i += 1
    py = ds_list_find_value(cir1list,i)
    draw_vertex_color(px,py,vcolor,alpha)
    }
draw_primitive_end()

//now draw the fade circle
draw_primitive_begin(pr_trianglestrip)
for(i = 0; i < vsize; i += 1){
    px = ds_list_find_value(cir1list,i)
    i += 1
    py = ds_list_find_value(cir1list,i)
    draw_vertex_colour(px,py,vcolor,alpha)
    px = ds_list_find_value(cir2list,i-1)
    py = ds_list_find_value(cir2list,i)
    //draw_vertex_color(px,py,fadecolor,fadealpha)
    draw_vertex_color(px,py,vcolor,fadealpha)
    }
draw_primitive_end()
    
ds_list_destroy(cir1list)
ds_list_destroy(cir2list)

draw_set_alpha(1)
draw_set_color(c_white)



