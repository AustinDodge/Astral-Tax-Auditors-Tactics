var vx,vstr;
vx = x-mx
//vx = x
vstr = hitdraw + " HP"

draw_sprite(sprite_index,0,vx,y)
draw_text(vx+(114-round(string_width(string_hash_to_newline(vstr))/2)),y+18,string_hash_to_newline(vstr))

