/// @description sDrawAuditorHead(mypalette,pindex,vx,vy)
/// @param mypalette
/// @param pindex
/// @param vx
/// @param vy
/*this script draws the head
*/
var mpalette,vindex,vx,vy;

mpalette = argument0
vindex = argument1
vx = argument2
vy = argument3

pal_swap_set(mpalette,vindex,true)//skin palette
draw_sprite(headsprite,facing,vx,vy)//draw head
pal_swap_reset()
