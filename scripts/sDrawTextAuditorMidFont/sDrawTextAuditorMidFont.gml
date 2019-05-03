/// @description sDrawTextAuditorMidFont(x,y,outlinecolor,maincolor,string)
/// @param x
/// @param y
/// @param outlinecolor
/// @param maincolor
/// @param string
/*This script draws text in the auditor mid font with the specified colors. Returns the width
of the drawn text.
*/
var vx,vy,voutlinecolor,vmaincolor,vstring,vwidth;
vx = argument0
vy = argument1
voutlinecolor = argument2
vmaincolor = argument3
vstring = argument4

draw_set_color(vmaincolor)
draw_set_font(fontAuditorMidBody)
draw_text(vx,vy,string_hash_to_newline(vstring))

draw_set_color(voutlinecolor)
draw_set_font(fontAuditorMidOutline)
draw_text(vx,vy,string_hash_to_newline(vstring))

//reset draw color
draw_set_color(c_white)

if is_real(vstring){
    vstring = string(vstring)
    }

vwidth = string_height(string_hash_to_newline(vstring))
return vwidth;
