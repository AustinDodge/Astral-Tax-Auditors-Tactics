/// @description sDrawUnitShadowHalfass()
/*This script is called by a unit to draw its shadow. It's not ideal, but the visual
shortcomings won't be noticable most of the time.
*/

var vx,vy,vsurface,dsurface,csurface,vheight,vwidth,vxcenter,vycenter,j,tx,ty;



if fallingpit = 0{//if it's moving from tile to tile
    vx = x
    vy = y
    if falling = 1 or climbing = 1{
        vx = mytile.x
        vy = mytile.y
        }
    if bouncing = 1{
        if walkstep < 8{
            vy += sAnimHumanBounce(walkstep)
            }else{
            vy -= sAnimHumanBounce(walkstep)
            }
        }
    draw_sprite_ext(shadowsprite,floor(animstep/8),vx,vy,1,1,0,c_white,0.3)
    }

