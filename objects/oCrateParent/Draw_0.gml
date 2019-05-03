if open = 0 and opening = 0{//closed
    draw_self()
    }
if opening = 1 and open = 0{//lid opening
    draw_sprite(sprite_index,1,x,y)
    draw_sprite(itemsprite,1,x,y-10)
    draw_sprite_ext(sprite_index,2,x,y-lidheight,1,1,0,c_white,lidalpha)
    }
if opening = 0 and open = 1{//open
    draw_sprite(sprite_index,1,x,y)
    draw_sprite(itemsprite,1,x,y-10)
    }
if disappearing = 1{
    draw_sprite_ext(sprite_index,1,x,y,1,1,0,c_white,myalpha)
    }

