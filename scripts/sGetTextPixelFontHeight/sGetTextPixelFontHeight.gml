/// @description sGetTextPixelFontHeight(tring,separation,width)
/// @param tring
/// @param separation
/// @param width
/*This script returns the height of the string drawn in the pixel font, givel a width
to limit the string to.
*/
var vx,vy,voutlinecolor,vmaincolor,vstring,vwidth,vheight,vsep;

vstring = argument0
vsep = argument1
vwidth = argument2

draw_set_font(fontSmallPixel)
//draw_text(vx,vy,vstring)


vheight = string_height_ext(string_hash_to_newline(vstring),vsep,vwidth)

return vheight;
