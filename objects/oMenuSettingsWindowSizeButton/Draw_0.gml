//draw_self()
var vrand;
vrand = irandom(2)
switch vrand{
    case 0: draw_set_color(c_ltgray); break;
    case 1: draw_set_color(c_gray); break;
    case 2: draw_set_color(c_white); break;
    }

draw_set_font(fontSmallPixel)
draw_text(x,y,string_hash_to_newline(mytext))
if mouseon = 1{
    draw_line(x-1,y+12,x+linewidth-1,y+12)
    }
    

