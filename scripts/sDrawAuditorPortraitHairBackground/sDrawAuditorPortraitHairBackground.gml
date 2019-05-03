/// @description sDrawAuditorPortraitHairBackground(mypalette,pindex,vx,vy,flipped?)
/// @param mypalette
/// @param pindex
/// @param vx
/// @param vy
/// @param flipped?
/*this script draws the portrait hair background
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

vind = hairtype
vy += portraitheightoffset
vy += portraitneckoffset

switch gender{
    case 0: draw_sprite_ext(sAuditorPortraitFemaleHairBackground,hairtype,vx,vy,vscale,1,0,c_white,1); break;//female, no suit drawn yet; break;
    case 1: ; break;//draw_sprite_ext(sAuditorPortraitMaleHair,hairtype,vx,vy,vscale,1,0,c_white,1); break;//male
    }

pal_swap_reset()
