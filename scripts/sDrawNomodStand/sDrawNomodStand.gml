/// @description sDrawNomodStand()

/*the script describing what to draw when a sprite with no mods is idle.
Animstep goes up each step, and the maxstep is when it resets. 

All image position manipulation happens in-sprite, so vx and vy are always zero. There is no weapon or hand to draw.
*/
var maxstep,vx,vy,pindex,scol,stepvar;
maxstep = 40//must be divible by 4!
stepvar = maxstep/4


vx = 0
vy = 0

scol = c_white
if aiactivated = 0{
    scol = c_gray
    }

if turnover = 0 and (aiactivated = 1 or team = 1){//if the turn is over, don't animate
    animstep += 1
    }else{
    animstep = 0
    }
    
vx = 0
vy = 0

if animstep > maxstep{
    animstep = 0
    }
if animstep >= 0{
    image_index = 0+facing
    }
//if animstep >= 16{
if animstep >= stepvar{
    image_index = 24+facing
    }
//if animstep >= 32{
if animstep >= stepvar*2{
    image_index = 0+facing
    }
//if animstep >= 48{
if animstep >= stepvar*3{
    image_index = 28+facing
    }
    
if moving = 0{
    draw_sprite_ext(shadowsprite,floor(animstep/stepvar),x,y,1,1,0,c_white,0.3)
    }else{
    if (falling = 1 and fallingpit = 0){
        draw_sprite_ext(shadowsprite,floor(animstep/stepvar),mytile.x,mytile.y,1,1,0,c_white,0.3)
        }
    if climbing = 1{
        draw_sprite_ext(shadowsprite,floor(animstep/stepvar),lasttile.x,lasttile.y,1,1,0,c_white,0.3)
        }
    }
    
vx += x
vy += y

//all image position manipulation happens in-sprite
draw_sprite_ext(sprite_index,image_index,vx,vy,1,1,0,scol,1)






