var vx,vy,vcol,vstring,vfriend,vlevel,vheight,i,vadd;

//draw_set_color(c_blue)
//draw_set_alpha(0.75)
//draw_rectangle(view_xview[0]+100,view_yview[0]+100,view_xview[0]+400,view_yview[0]+300,0)
//draw_set_color(c_white)
//draw_set_alpha(1)
draw_self()

vx = x+10
vy = y+10

//draw_text(vx,vy,targetnamestring)

if ds_exists(friendlist,ds_type_list){
    for (i = 0; i < ds_list_size(friendlist); i += 1){
        vfriend = ds_list_find_value(friendlist,i)
        vlevel = sGetUnitRelationshipLevel(target,vfriend,0)
        vstring = target.name+" reached friend level "+string(vlevel)+" with "+vfriend.name+"!"
        vadd = sDrawTextAuditorFontWidth(vx,vy,c_black,c_white,vstring,160)
        vy += 3 + vadd
        }
    }






