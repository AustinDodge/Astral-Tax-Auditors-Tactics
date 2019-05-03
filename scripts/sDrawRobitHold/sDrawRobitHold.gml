/// @description sDrawRobitHold()

/*the script describing what to draw when a robit is holding an item. Animstep is controlled
by the item the unit is holding.
*/
var maxstep,vx,vy,pindex,scol;
maxstep = 1
vx = 0
vy = 0

scol = c_white

//only one frame
image_index = 24+facing
vx = 0
vy = 0

    
    
vx += x
vy += y

if moving = 0{
    draw_sprite_ext(shadowsprite,floor(animstep/8),vx,vy,1,1,0,c_white,0.3)
    }

//only draws the sprite right now
draw_sprite(sprite_index,image_index,vx,vy)
//sDrawRobitWeapon(vx,vy,image_index)
sDrawRobitHand(vx,vy,image_index,scol)






