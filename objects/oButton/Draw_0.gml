if glowing = 1{
    draw_sprite_ext(glowsprite,0,x,y,1,1,0,c_white,glowalpha)
    
    }

if mouseon = 1{
    if mystring != 0{
        sDoTooltip(x+(sprite_width-sprite_xoffset),y+(sprite_height-sprite_yoffset),mystring,tipwidth,tipborder,0,tipsep)
        }
    }

draw_self()
if mystring != 0{
    var vx;
    vx = x+round(sprite_width/2)
    draw_set_font(fontAuditorShadow)
    vx -= ceil(string_width(string_hash_to_newline(mystring))/2)
    sDrawTextAuditorFont(vx+2,y+4,c_black,c_white,mystring)
    }

