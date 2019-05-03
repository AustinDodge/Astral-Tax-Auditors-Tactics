/// @description sDrawAuditorPortraitBody(mypalette,pindex,vx,vy,flipped?)
/// @param mypalette
/// @param pindex
/// @param vx
/// @param vy
/// @param flipped?
/*this script draws the portrait body
*/
var mpalette,vindex,vx,vy,vflipped,vscale;

mpalette = argument0
vindex = argument1
vx = argument2
vy = argument3
vflipped = argument4
vscale = 1
if vflipped = 1{
    vscale = -1
    }
vy += portraitheightoffset
pal_swap_set(mpalette,vindex,true)//main palette
switch gender{
    case 0: draw_sprite_ext(sAuditorPortraitFemaleSuit,portraitsuitindex,vx,vy,vscale,1,0,c_white,1); break;//female
    case 1: draw_sprite_ext(sAuditorPortraitMaleSuit,portraitsuitindex,vx,vy,vscale,1,0,c_white,1); break;//male
    }

pal_swap_reset()
