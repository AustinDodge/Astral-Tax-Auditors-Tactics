/// @description sDrawNomodRecoil()

/*the script describing what to draw when sprite with no mods is recoiling from an attack.
Animstep goes up each step, and the maxstep is when it resets. 
*/
var maxstep,vx,vy,pindex,scol;
maxstep = 1
vx = 0
vy = 0

//only one frame
image_index = 20+facing
vx = 0
vy = 0

scol = c_white
if fallfadestage > 0{
    scol = merge_color(c_white,c_black,fallfadestage/fallfadesteps)
    }
    
vx += x
vy += y

if moving = 0{
    draw_sprite_ext(shadowsprite,floor(animstep/8),x,y,1,1,0,c_white,0.3)
    }else{
    if (falling = 1 and fallingpit = 0){
        draw_sprite_ext(shadowsprite,floor(animstep/8),mytile.x,mytile.y,1,1,0,c_white,0.3)
        }
    if climbing = 1{
        draw_sprite_ext(shadowsprite,floor(animstep/8),lasttile.x,lasttile.y,1,1,0,c_white,0.3)
        }
    }

//only draws the sprite right now
draw_sprite_ext(sprite_index,image_index,vx,vy,1,1,0,scol,1)





