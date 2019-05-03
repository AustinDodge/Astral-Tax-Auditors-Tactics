if drawme = 1{
    var vy,j;
    if bordern = 1{
        draw_sprite(sprite_index,1,x,y)
        j = 2
        while j < elevation-1{
            j += 1
            draw_sprite(sprite_index,3,x,y+(j*elevheight))
            }
        }
    if bordere = 1{
        draw_sprite(sprite_index,2,x,y)
        j = 2
        while j < elevation-1{
            j += 1
            draw_sprite(sprite_index,4,x,y+(j*elevheight))
            }
        }
    draw_sprite(sprite_index,0,x,y+(elevation*elevheight))
    
    }

