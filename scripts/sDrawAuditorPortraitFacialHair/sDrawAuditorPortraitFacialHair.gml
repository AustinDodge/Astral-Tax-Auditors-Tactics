/// @description sDrawAuditorPortraitFacialHair(mypalette,pindex,vx,vy,flipped?)
/// @param mypalette
/// @param pindex
/// @param vx
/// @param vy
/// @param flipped?
/*this script draws the portrait hair
*/
var mpalette,vindex,vx,vy,vflipped,vscale,vind;

mpalette = argument0
vindex = argument1
vx = argument2
vy = argument3
vflipped = argument4
vscale = 1
if vflipped = 1{
    vscale = -1
    }
pal_swap_set(mpalette,vindex,true)//main palette

vind = portraitheadindex
//vind = 0
vy += portraitheightoffset
vy += portraitneckoffset
vy += portraitnoseoffset


switch facialhair{
    case 1: draw_sprite_ext(sAuditorPortraitBeard1,vind,vx,vy,vscale,1,0,c_white,1); break;//1 beard1
    case 2: draw_sprite_ext(sAuditorPortraitMustache1,vind,vx,vy,vscale,1,0,c_white,1); break;//2 mustache1
    }


pal_swap_reset()
