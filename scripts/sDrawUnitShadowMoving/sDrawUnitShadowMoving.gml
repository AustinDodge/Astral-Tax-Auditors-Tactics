/// @description sDrawUnitShadowMoving()
/*This script is called whenever a unit is not standing still but needs a shadow drawn
underneath it. It is called by the unit and assumes it has access to all the internal
variables that unit uses when moving.
*/


/*//all commented out because this script isn't used anymore


var vx,vy,vsurface,dsurface,csurface,vheight,vwidth,vxcenter,vycenter,j,tx,ty;
vheight = 128
vwidth = 128

vsurface = surface_create(vheight,vwidth)
dsurface = surface_create(vheight,vwidth)
csurface = surface_create(vheight,vwidth)
vxcenter = floor(vwidth/2)
vycenter = floor(vheight/2)


vx = vxcenter
vy = vycenter


//draw_sprite(atilemarker,0,lasttile.x,lasttile.y)


if fallingpit = 0 and climbing = 0 and falling = 0{//if it's moving from tile to tile
    //this part activates if the unit is walking, bouncing, or is knocked
    j = 0
    while j< walkstep{
        switch facing{
        case 0://facing n
            vx -= sAnimWalk(j)
            j += 1
            vy -= sAnimWalk(j)
            j += 1
            ; break;
        case 1://facing e
            vx += sAnimWalk(j)
            j += 1
            vy -= sAnimWalk(j)
            j += 1
            ; break;
        case 2://facing s
            vx += sAnimWalk(j)
            j += 1
            vy += sAnimWalk(j)
            j += 1
            ; break;
        case 3://facing w
            vx -= sAnimWalk(j)
            j += 1
            vy += sAnimWalk(j)
            j += 1
            ; break;
            }
        }
    //vx -= vxcenter
    //vy -= vycenter
    //draw_sprite(spsmallshadow,0,lasttile.x+vx,lasttile.y+vy)
    //vx += vxcenter
    //vy += vycenter
    //first draw a white surface and cut-out the shape of the tile
    surface_set_target(csurface)
    draw_clear_alpha(c_white,1)
    draw_set_blend_mode_ext(bm_inv_dest_alpha,bm_inv_src_alpha)
    draw_sprite(lasttile.sprite_index,0,vxcenter,vycenter)
    draw_set_blend_mode(bm_normal)
    surface_reset_target()
    //csurface now contains a white sprite with a 0-alpha cutout of a tile
    //Draw the shadow sprite to a new surface
    surface_set_target(vsurface)
    draw_clear_alpha(c_white,0)
    draw_sprite(shadowsprite,0,vx,vy)
    surface_reset_target()
    //now draw the cutout THEN the shadow to a new surface
    surface_set_target(dsurface)
    draw_clear_alpha(c_white,0)
    draw_set_blend_mode_ext(bm_inv_dest_alpha,bm_zero)
    draw_surface(csurface,0,0)
    draw_surface(vsurface,0,0)
    surface_reset_target()
    draw_set_blend_mode(bm_normal)
    
    //now draw that surface to the screen.
    draw_surface_ext(dsurface,lasttile.x-vxcenter,lasttile.y-vycenter,1,1,0,c_white,0.3)
    
    
    if !surface_exists(vsurface){
        vsurface = surface_create(vheight,vwidth)
        }
    if !surface_exists(dsurface){
        dsurface = surface_create(vheight,vwidth)
        }
    if !surface_exists(csurface){
        csurface = surface_create(vheight,vwidth)
        }
    
    //we've drawn one part of the shadow to the current tile
    //once that's working we'll draw the part over the next tile
    switch facing{
        case 0: tx = vxcenter - drawtilexadd; ty = vycenter - drawtileyadd; break;
        case 1: tx = vxcenter + drawtilexadd; ty = vycenter - drawtileyadd; break;
        case 2: tx = vxcenter + drawtilexadd; ty = vycenter + drawtileyadd; break;
        case 3: tx = vxcenter - drawtilexadd; ty = vycenter + drawtileyadd; break;
        }
    //similar to the first time around, except the cutout is the forward tile rather than the previous one.
    surface_set_target(csurface)
    draw_clear_alpha(c_white,1)
    draw_set_blend_mode_ext(bm_inv_dest_alpha,bm_inv_src_alpha)
    draw_sprite(mytile.sprite_index,0,tx,ty)
    draw_set_blend_mode(bm_normal)
    surface_reset_target()
    //csurface now contains a white sprite with a 0-alpha cutout of a tile
    //Draw the shadow sprite to a new surface
    surface_set_target(vsurface)
    draw_clear_alpha(c_white,0)
    draw_sprite(shadowsprite,0,vx,vy)
    surface_reset_target()
    //now draw the cutout THEN the shadow to a new surface
    surface_set_target(dsurface)
    draw_clear_alpha(c_white,0)
    draw_set_blend_mode_ext(bm_inv_dest_alpha,bm_zero)
    draw_surface(csurface,0,0)
    draw_surface(vsurface,0,0)
    
    surface_reset_target()
    draw_set_blend_mode(bm_normal)
    
    //now draw that surface to the screen.
    draw_surface_ext(dsurface,mytile.x-tx,mytile.y-ty,1,1,0,c_white,0.3)
        
    }else{//if it's falling or climbing
    draw_sprite_ext(shadowsprite,floor(animstep/8),lasttile.x,lasttile.y,1,1,0,c_white,0.3)
    }

surface_free(dsurface)
surface_free(csurface)
surface_free(vsurface)
