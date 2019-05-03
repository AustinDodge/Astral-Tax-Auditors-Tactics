if stage = 5{
    var vsize,i,vtile;
    vsize = ds_list_size(drawaiscorelist)
    //draw_sprite(atilemarker,0,bestmovetile.x,bestmovetile.y)
    //draw_sprite(atilemarker,0,currentunit.x,currentunit.y)
    for(i = 0; i < vsize; i += 1){
        vtile = ds_list_find_value(drawaiscorelist,i)
        draw_set_font(fontminfont)
        draw_set_color(c_black)
        draw_text(vtile.x-10,vtile.y-5,string_hash_to_newline(vtile.myaiscore))
        draw_set_color(c_white)
        }
    }
    //*/
    /*var vgrid,vtile;
    vgrid = ds_list_find_value(dmaplist,drawaidmap)
    draw_set_font(fontminfont)
    draw_set_color(c_black)
    with oMapTile{
        draw_text(x-10,y-5,ds_grid_get(vgrid,mx,my))
        }
    }

/* */
/*  */
