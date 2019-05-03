var vunit,vpos,i;

if ds_list_size(myunitlist) > 0{
    for (i = 0; i < ds_list_size(myunitlist); i += 1){
        vunit = ds_list_find_value(myunitlist,i)
        draw_sprite(spexclamationpoint,0,vunit.x,vunit.y-20)
        }
    }

