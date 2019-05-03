//draw_self()
var vrand,vx1,vy1,vx2,vy2;
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

if selected = 1{
    draw_set_color(c_yellow)
    vx1 = x-3
    vy1 = y-3
    vx2 = x+linewidth+3
    vy2 = y+string_height(string_hash_to_newline(mytext))+3
    draw_rectangle(vx1,vy1,vx2,vy2,1)
    }
    

