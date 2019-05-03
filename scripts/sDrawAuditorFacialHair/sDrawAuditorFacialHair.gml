/// @description sDrawAuditorFacialHair(mypalette,pindex,vx,vy)
/// @param mypalette
/// @param pindex
/// @param vx
/// @param vy
/*this script draws the hair
*/
var mpalette,vindex,vx,vy;

mpalette = argument0
vindex = argument1
vx = argument2
vy = argument3

if gender = 1 and facialhair > 0{
    pal_swap_set(mpalette,vindex,true)
    draw_sprite(facialhairsprite,facing,vx,vy)//draw hair
    pal_swap_reset()
    }
