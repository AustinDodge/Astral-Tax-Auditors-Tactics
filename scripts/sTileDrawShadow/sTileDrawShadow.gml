/// @description sTileDrawShadow()
/*This script is called to draw a shadow under a unit. It's called by the tile so that
depth can be properly drawn, but the majority of the action happens in a "with" statement
regarding the unit. It's a modification of a previous script that was ran by the unit.
*/

var vx,vy,vheight,vwidth,vxcenter,vycenter,j,tx,ty,vtile,vdir,
vknock,ntile;
vheight = 64
vwidth = 64


vxcenter = floor(vwidth/2)
vycenter = floor(vheight/2)


vx = vxcenter
vy = vycenter

vtile = id
vknock = 0



if shadowunit > 0{
    with shadowunit{
        if fallingpit = 0 and moving = 1{
            //vx = x - vtile.x
            //vy = y - vtile.y
            
            //vx += xcenter
            //vy += ycenter
            j = 0
            if amknocked = 1 or bouncing = 1{
                vdir = knockdir
                vknock = 1
                //vdir = facing
                }else{
                vdir = facing
                }
            
            while j< walkstep{
                switch vdir{
                case -1://no facing, used when an explosion happens on the same tile
                    j += 2
                    ; break;
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
            tx = vxcenter
            ty = vycenter
            if vknock = 0{
                if vtile = mytile{
                    switch vdir{
                        case 0: tx = vxcenter - drawtilexadd; ty = vycenter - drawtileyadd; break;
                        case 1: tx = vxcenter + drawtilexadd; ty = vycenter - drawtileyadd; break;
                        case 2: tx = vxcenter + drawtilexadd; ty = vycenter + drawtileyadd; break;
                        case 3: tx = vxcenter - drawtilexadd; ty = vycenter + drawtileyadd; break;
                        }
                    }
                }else{
                if walkstep < tilemovespeed/2{
                    ntile = nexttile
                    }else{
                    ntile = mytile
                    }
                if vtile = ntile{
                    switch vdir{
                        case 0: tx = vxcenter - drawtilexadd; ty = vycenter - drawtileyadd; break;
                        case 1: tx = vxcenter + drawtilexadd; ty = vycenter - drawtileyadd; break;
                        case 2: tx = vxcenter + drawtilexadd; ty = vycenter + drawtileyadd; break;
                        case 3: tx = vxcenter - drawtilexadd; ty = vycenter + drawtileyadd; break;
                        }
                    }
                }
                
            if !surface_exists(shadowvsurface){
                shadowvsurface = surface_create(vheight,vwidth)
                }
            if !surface_exists(shadowdsurface){
                shadowdsurface = surface_create(vheight,vwidth)
                }
            if !surface_exists(shadowcsurface){
                shadowcsurface = surface_create(vheight,vwidth)
                }
            
            //first draw a white surface and cut-out the shape of the tile
            surface_set_target(shadowcsurface)
            draw_clear_alpha(c_white,1)
            draw_set_blend_mode_ext(bm_inv_dest_alpha,bm_inv_src_alpha)
            draw_sprite(vtile.sprite_index,0,tx,ty)
            draw_set_blend_mode(bm_normal)
            surface_reset_target()
            //shadowcsurface now contains a white sprite with a 0-alpha cutout of a tile
            //Draw the shadow sprite to a new surface
            surface_set_target(shadowvsurface)
            draw_clear_alpha(c_white,0)
            draw_sprite(shadowsprite,0,vx,vy)
            surface_reset_target()
            //now draw the cutout THEN the shadow to a new surface
            surface_set_target(shadowdsurface)
            draw_clear_alpha(c_white,0)
            draw_set_blend_mode_ext(bm_inv_dest_alpha,bm_zero)
            draw_surface(shadowcsurface,0,0)
            draw_surface(shadowvsurface,0,0)
            surface_reset_target()
            draw_set_blend_mode(bm_normal)
            
            //now draw that surface to the screen.
            draw_surface_ext(shadowdsurface,vtile.x-tx,vtile.y-ty,1,1,0,c_white,0.3)
            
            //surface_free(shadowdsurface)
            //surface_free(shadowcsurface)
            //surface_free(shadowvsurface)
            }
        }
    }


