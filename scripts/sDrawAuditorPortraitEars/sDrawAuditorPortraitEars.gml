/// @description sDrawAuditorPortraitEars(mypalette,pindex,vx,vy,flipped?)
/// @param mypalette
/// @param pindex
/// @param vx
/// @param vy
/// @param flipped?
/*this script draws the portrait nose
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
pal_swap_set(mpalette,vindex,true)//main palette
vy += portraitheightoffset
vy += portraitneckoffset

draw_sprite_ext(sAuditorPortraitPartsEar,portraitnoseindex,vx,vy,vscale,1,0,c_white,1)


pal_swap_reset()
