/// @description sGNoiseDraw()

/*called by an object to animate its gnoise object.
*/

if !surface_exists(mainsurface){
    mainsurface = surface_create(width,height)
    }
if !surface_exists(tsurface){
    tsurface = surface_create(subwidth,subheight)
    }
//if !surface_exists(backsurface){
//    backsurface = surface_create(width,height)
//    }
    
//draw the shapes on tsurface
var vnum,vx,vy,vwidth,vheight,i,vmod;
vnum = ds_list_size(shapexlist)

surface_set_target(tsurface)
draw_clear_alpha(backcol,0)
//draw_set_blend_mode(bm_add)
//draw_set_alpha(0.5)
draw_set_color(forecol)
for(i = 0; i < vnum; i += 1){
    //get the shape values
    vx = ds_list_find_value(shapexlist,i)
    vy = ds_list_find_value(shapeylist,i)
    vwidth = ds_list_find_value(shapewidthlist,i)
    vheight = ds_list_find_value(shapeheightlist,i)
    //draw the shape
    draw_rectangle(vx,vy,vwidth,vheight,0)
    //modify the values
    sGNoiseChangeShape(vx,vy,vwidth,vheight,i)
    }
surface_reset_target()
//draw the surface scaled repeatedly
surface_set_target(mainsurface)
draw_set_alpha(1)
draw_clear_alpha(backcol,0)
draw_set_color(backcol)
//draw_rectangle(0,0,width,height,0)
//draw_set_blend_mode_ext(bm_src_alpha,bm_zero)
var startx,starty;
vscale = 1
startx = 0-(subheight*random_range(8.0,9.5))
starty = 0-(subwidth*random_range(4.0,5.5))
for (i = 1; i < iterations+1; i += 1){//i must start at 1 so vwidth and vheight aren't 0
    vwidth = subwidth*(i*multiplescale)
    vheight = subheight*(i*multiplescale)
    startx = 0-round(vwidth/2)
    starty = 0-round(vheight/2)
    vy = starty
    while vy < height{
        vx = startx
        while vx < width{
            draw_surface_stretched_ext(tsurface,vx,vy,vwidth,vheight,c_white,0.75)
            vx += vwidth
            }
        vy += vheight
        }
    }
draw_set_color_write_enable(false,false,false,true)
draw_set_alpha(1)
draw_rectangle(0,0,width,height,0)
draw_set_color_write_enable(true,true,true,true)
surface_reset_target()

/*
surface_set_target(backsurface)
draw_clear_alpha(backcol,1)
draw_set_blend_mode(bm_normal)
//draw_set_color_write_enable(true,true,true,false)
draw_surface(mainsurface,0,0)
surface_reset_target()
//draw_set_color_write_enable(true,true,true,true)
*/

draw_set_color(c_white)
draw_set_alpha(1)
draw_set_blend_mode(bm_normal)

return mainsurface;




