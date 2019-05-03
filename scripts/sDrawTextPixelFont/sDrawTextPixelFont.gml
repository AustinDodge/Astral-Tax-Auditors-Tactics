/// @description sDrawTextPixelFont(x,y,maincolor,string)
/// @param x
/// @param y
/// @param maincolor
/// @param string
/*This script draws text in the auditor single-pixel font with the specified color.
Returns the width of the string as drawn.
*/
var vx,vy,voutlinecolor,vmaincolor,vstring,vwidth,vheight;
vx = argument0
vy = argument1
vmaincolor = argument2
vstring = argument3
vheight = -1

draw_set_color(vmaincolor)
draw_set_font(fontSmallPixel)
//draw_text(vx,vy,vstring)
draw_text(vx,vy,string_hash_to_newline(vstring))

//reset draw color
draw_set_color(c_white)

if is_real(vstring){
    vstring = string(vstring)
    }

vwidth = string_height(string_hash_to_newline(vstring))

return vwidth;
