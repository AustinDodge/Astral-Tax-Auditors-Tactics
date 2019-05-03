var vx,vstr;
vx = x+mx
//vx = x
if hitdraw != "-"{
    vstr = hitdraw + "%"
    }else{
    vstr = hitdraw
    }

draw_sprite(sprite_index,3,vx,y)
draw_text(vx+(24-round(string_width(string_hash_to_newline(vstr))/2)),y+18,string_hash_to_newline(vstr))

