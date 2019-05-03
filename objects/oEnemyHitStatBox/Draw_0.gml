var vx,vstr;
vx = x+mx
//vx = x
if hitdraw != "-"{
    vstr = hitdraw + "%"
    }else{
    vstr = hitdraw
    }

draw_sprite(sprite_index,0,vx,y)
draw_text(vx+(24-round(string_width(string_hash_to_newline(vstr))/2)),y+18,string_hash_to_newline(vstr))
sDrawTextAuditorFont(vx+20,y-8,c_white,c_red,drawname)

