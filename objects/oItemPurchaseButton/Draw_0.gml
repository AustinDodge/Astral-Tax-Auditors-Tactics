draw_self()
if oversprite > 0{
    draw_sprite_ext(oversprite,0,x,y,1,1,0,blendcolor,1)
    }
if mouseon = 1{
    if mystring != 0{
        sDoTooltip(x+(sprite_width-sprite_xoffset),y+(sprite_height-sprite_yoffset),mystring,tipwidth,tipborder,0,tipsep)
        }
    }

var vx,vy,vlength,vstr,vnum;
/*
vx = x+round(sprite_width/2)
vx -= inventorynumberwidth*2

vy = y+round(sprite_width/2)
vy -= inventorynumberheight*2

if uses > -2{//-2 don't draw uses
    if uses = -1{
        //draw a dash for unlimited uses
        draw_sprite(spritemusenumbers,10,vx,vy)
        }else{
        var vblend;
        vblend = c_white
        //draw the number of uses
        vx -= inventorynumberwidth*(string_length(string(uses))-1)
        vstr = string(uses)
        if isweapon = 1 or isarmor = 1{
            if uses <= 5{
                vblend = c_red
                }
            }
            
        while string_length(vstr) > 0{
            vnum = string_char_at(vstr,0)
            vnum = real(vnum)
            draw_sprite_ext(spritemusenumbers,vnum,vx,vy,1,1,0,vblend,1)
            vx += inventorynumberwidth-1
            vstr = string_delete(vstr,1,1)
            }
        }
    }

/* */
/*  */
