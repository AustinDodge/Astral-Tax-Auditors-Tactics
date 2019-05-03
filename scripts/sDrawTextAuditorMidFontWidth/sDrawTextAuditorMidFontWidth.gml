/// @description sDrawTextAuditorFontWidth(x,y,outlinecolor,maincolor,string,width)
/// @param x
/// @param y
/// @param outlinecolor
/// @param maincolor
/// @param string
/// @param width
/*This script draws text in the auditor font with the specified colors with breaks
inserted so it fits within the specified width. Returns the height of the string.
*/
var vx,vy,voutlinecolor,vmaincolor,vstring,vwidth,vheight;
vx = argument0
vy = argument1
voutlinecolor = argument2
vmaincolor = argument3
vstring = argument4
vwidth = argument5
vheight = -1

draw_set_color(vmaincolor)
draw_set_font(fontAuditorMidBody)
//draw_text(vx,vy,vstring)
draw_text_ext(vx,vy,string_hash_to_newline(vstring),string_height(string_hash_to_newline("L")),vwidth)

draw_set_color(voutlinecolor)
draw_set_font(fontAuditorMidOutline)
//draw_text(vx,vy,vstring)
draw_text_ext(vx,vy,string_hash_to_newline(vstring),string_height(string_hash_to_newline("L")),vwidth)

//reset draw color
draw_set_color(c_white)

if is_real(vstring){
    vstring = string(vstring)
    }

vheight = string_height_ext(string_hash_to_newline(vstring),string_height(string_hash_to_newline("L")),vwidth)

return vheight;
