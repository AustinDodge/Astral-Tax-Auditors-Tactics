/// @description sDrawSkullsplodeAttack()

/*the script describing what to draw when a skullsplode is attacking.
Animstep goes up each step, and the maxstep is when it resets. 
*/
var maxstep,vx,vy,pindex,scol;
maxstep = 1
vx = 0
vy = 0

scol = c_white

if attackanimtype = 0{//if it's short-range attack animation
    if animstep = 0{
        image_index = 12+facing
        vx = 0
        vy = 0
        }
    if animstep = 1{
        image_index = 16+facing
        vx = 0
        vy = 0
        }
    }else{//if it's long-range attack animation
    if animstep = 0{
        image_index = 4+facing
        vx = 0
        vy = 0
        }
    if animstep = 1{
        image_index = 8+facing
        vx = 0
        vy = 0
        }
    }
    
    
vx += x
vy += y

if moving = 0{
    draw_sprite_ext(shadowsprite,floor(animstep/8),vx,vy,1,1,0,c_white,0.3)
    }


//only draws the sprite right now
draw_sprite(sprite_index,image_index,vx,vy)





