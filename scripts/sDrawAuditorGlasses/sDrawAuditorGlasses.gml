/// @description sDrawAuditorGlasses(mypalette,pindex,vx,vy)
/// @param mypalette
/// @param pindex
/// @param vx
/// @param vy
/*this script draws the entire body, including the back arm
*/
var mpalette,vindex,vx,vy;

mpalette = argument0
vindex = argument1
vx = argument2
vy = argument3

pal_swap_set(mpalette,vindex,true)//main palette
if glassesindex > 0{
    switch glassesindex{
        case 1: draw_sprite(sauditorglasses1,facing,vx,vy); break;//draw glasses1
        case 2: draw_sprite(sauditorglasses2,facing,vx,vy); break;//draw glasses2
        }
    }
pal_swap_reset()
