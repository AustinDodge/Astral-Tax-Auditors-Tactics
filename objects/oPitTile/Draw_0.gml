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
    //draw_self()
    /*if bordern = 1{
        draw_sprite(bordersprite,0,x,y)
        }
    if bordere = 1{
        draw_sprite(bordersprite,1,x,y)
        }
    if borders = 1{
        draw_sprite(bordersprite,2,x,y)
        }
    if borderw = 1{
        draw_sprite(bordersprite,3,x,y)
        }
    if atile = 1{
        //draw_sprite(sprite2,0,x,y)
        }
    if drawaxislines = 1{
        if onxaxis = 1{
            draw_sprite(cursoraxisline,2,x,y)
            }
        if onyaxis = 1{
            draw_sprite(cursoraxisline,1,x,y)
            }
        }*/
    }

/* */
/*  */
