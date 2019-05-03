/// @description sDrawAuditorFrontArm(mypalette,pindex,vx,vy)
/// @param mypalette
/// @param pindex
/// @param vx
/// @param vy
/*this script draws the front arm including the hand
*/
var mpalette,vindex,vx,vy;

mpalette = argument0
vindex = argument1
vx = argument2
vy = argument3

pal_swap_set(mpalette,vindex,true)//main palette
draw_sprite(frontarmsprite,image_index,vx,vy)//draw front arm
pal_swap_reset()
