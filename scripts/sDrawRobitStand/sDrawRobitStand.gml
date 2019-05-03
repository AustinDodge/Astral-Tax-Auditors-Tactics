/// @description sDrawAuditorStand()

/*the script describing what to draw when a robit is idle.
Animstep goes up each step, and the maxstep is when it resets. 
*/
var maxstep,vx,vy,pindex,scol;
maxstep = 64
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

if animstep > maxstep{
    animstep = 0
    }
if animstep >= 0{
    image_index = 0+facing
    vx = 0
    vy = 0
    }
if animstep >= 16{
    image_index = 24+facing
    if moving = 0{//don't play with x and y if moving to a new tile
        vx = 0
        vy = -1
        }
    }
if animstep >= 32{
    image_index = 0+facing
    vx = 0
    vy = 0
    }
if animstep >= 48{
    image_index = 28+facing
    if moving = 0{
        vx = 0
        vy = -1
        }
    }

if moving = 0{
    draw_sprite_ext(shadowsprite,floor(animstep/16),x,y,1,1,0,c_white,0.3)
    }else{
    if (falling = 1 and fallingpit = 0){
        draw_sprite_ext(shadowsprite,floor(animstep/8),mytile.x,mytile.y,1,1,0,c_white,0.3)
        }
    if climbing = 1{
        draw_sprite_ext(shadowsprite,floor(animstep/8),lasttile.x,lasttile.y,1,1,0,c_white,0.3)
        }
    }
    
vx += x
vy += y

//only draws the sprite right now
draw_sprite_ext(sprite_index,image_index,vx,vy,1,1,0,scol,1)
sDrawRobitWeapon(vx,vy,image_index,scol)
sDrawRobitHand(vx,vy,image_index,scol)






