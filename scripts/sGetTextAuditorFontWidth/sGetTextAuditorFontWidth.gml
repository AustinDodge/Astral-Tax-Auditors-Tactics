/// @description sGetTextAuditorFontWidth(tring)
/// @param tring
/*This script returns the width of the string drawn in the Auditor font
*/
var vx,vy,voutlinecolor,vmaincolor,vstring,vwidth,vheight;

vstring = argument0

draw_set_font(fontAuditorShadowMain)
//draw_text(vx,vy,vstring)


vwidth = string_width(string_hash_to_newline(vstring))

return vwidth;
