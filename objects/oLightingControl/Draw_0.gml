var vx,vy,vlist,vaddme,i,vsize,vunit,vlight,vcol,vflux,vsurf,valpha;

if !surface_exists(shadowsurface){
    shadowsurface = surface_create(camrealwidth,camrealheight)
    }
if !surface_exists(drawsurface){
    drawsurface = surface_create(camrealwidth,camrealheight)
    }
surface_set_target(shadowsurface)
draw_clear_alpha(color1,1)
surface_reset_target()
vcol = color1
valpha = 1

draw_set_blend_mode_ext(bm_src_alpha,bm_dest_alpha)

//draw the unit lights
vlist = ds_list_create()
/*with oUnitParent{
    vaddme = 0
    if object_index = oAuditor{
        vaddme = 1
        }
    if team = 1{
        vaddme = 1
        }
    if aiactivated = 1{
        vaddme = 1
        }
    if unitisobject = 1 or unitisitem = 1{
        vaddme = 0
        }
        
    if vaddme = 1{
        ds_list_add(vlist,id)
        }
    
    }
vsize = ds_list_size(vlist)
for(i = 0; i < vsize; i += 1){
    vunit = ds_list_find_value(vlist,i)
    with vunit{
        vx = x-view_xview[0]
        vy = y-view_yview[0]
        vy -= 6
        sDrawLightCircle(vx,vy,15,30,1,c_gray)
        }
    }
    
ds_list_clear(vlist)
with oLightSource{
    ds_list_add(vlist,id)
    }
vsize = ds_list_size(vlist)

for (i = 0; i < vsize; i += 1){
    vlight = ds_list_find_value(vlist,i)
    with vlight{
        vx = x-view_xview[0]
        vy = y-view_yview[0]
        vy -= 6
        sDrawLightCircle(vx,vy,1,c_gray)
        }
    }*/
with oLightSource{
    if initialized = 1{
        //make sure the surfaces exist
        if !surface_exists(sketchsurface){
            sketchsurface = surface_create(radius*2,radius*2)
            }
        if !surface_exists(drawsurface){
            drawsurface = surface_create(radius*2,radius*2)
            }
        //set vflux
        vflux = random_range(1.0-fluctuation,1.0)
        
        surface_set_target(sketchsurface)
        draw_clear_alpha(vcol,0)
        surface_reset_target()
        
        surface_set_target(drawsurface)
        draw_clear_alpha(c_white,0)
        shader_set(shader_DrawFadeCircle)
        shader_set_uniform_f(uni_lightprhandle,radius,radius,radius,pureradius)
        shader_set_uniform_f(uni_lightfluxhandle,vflux)
        draw_surface_ext(sketchsurface,0,0,1,1,0,vcol,valpha)
        shader_reset()
        surface_reset_target()
        
        surface_set_target(oLightingControl.shadowsurface)
        vx = x-__view_get( e__VW.XView, 0 )
        vx -= radius
        vy = (y-__view_get( e__VW.YView, 0 ))-6
        vy -= radius
        draw_surface(drawsurface,vx,vy)
        surface_reset_target()
        
        //sDrawLightCircle(vx,vy,1,c_gray)
        }
    }
    
    
draw_set_blend_mode(bm_normal)
    
surface_set_target(drawsurface)
//shader_set(shade_ValueLimit)
shader_set(shade_ColorLimit)
shader_set_uniform_f(uni_gammahandle,gamma)
shader_set_uniform_f(uni_numcolorshandle,numcolors)
draw_clear_alpha(c_black,0)
draw_surface_ext(shadowsurface,0,0,1,1,0,c_black,1)
shader_reset()

surface_reset_target()
draw_set_blend_mode_ext(bm_dest_color,bm_zero)
draw_surface_ext(drawsurface,__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),1,1,0,c_white,1)
draw_set_blend_mode(bm_normal)

ds_list_destroy(vlist)


/* */
/*  */
