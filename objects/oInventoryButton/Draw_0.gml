if equipped = 1{
    draw_sprite(spinventoryequipped,0,x,y)
    }
draw_self()
if oversprite > 0{
    draw_sprite(oversprite,0,x,y)
    }
var vx,vy,vlength,vstr,vnum;

vx = x+round(sprite_width/2)
vx -= inventorynumberwidth*2

vy = y+round(sprite_width/2)
vy -= inventorynumberheight*2

if uses > -2{//-2 don't draw uses
    if uses = -1{
        //draw a dash for unlimited uses
        draw_sprite(spritemusenumbers,10,vx-1,vy)
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

