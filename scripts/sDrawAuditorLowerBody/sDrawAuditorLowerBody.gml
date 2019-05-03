/// @description sDrawAuditorLowerBody(mypalette,pindex,vx,vy)
/// @param mypalette
/// @param pindex
/// @param vx
/// @param vy
/*this script draws the lower body, pants, skirt, etc
*/
var mpalette,vindex,vx,vy;

mpalette = argument0
vindex = argument1
vx = argument2
vy = argument3

pal_swap_set(mpalette,vindex,true)//main palette
draw_sprite(lowerbodysprite,image_index,vx,vy)//draw lower body
pal_swap_reset()
