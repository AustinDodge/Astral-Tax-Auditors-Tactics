if drawme = 1{
    var vy,j;//draw the shadow on neighboring walls and floor
    if shadown = 1{
        draw_sprite(sPitSpriteFade,1,x,y)
        j = 2
        while j < elevation-1{
            j += 1
            draw_sprite(sPitSpriteFade,3,x,y+(j*elevheight))
            }
        }
    if shadowe = 1{
        draw_sprite(sPitSpriteFade,2,x,y)
        j = 2
        while j < elevation-1{
            j += 1
            draw_sprite(sPitSpriteFade,4,x,y+(j*elevheight))
            }
        }
    if myobject = 0{
        draw_sprite(sPitSpriteFade,0,x,y+(elevation*elevheight))
        }else{
        draw_sprite(sPitSpriteFade,0,x,y+((elevation-myobject.obstacleheight)*elevheight))
        }
    
    draw_self()
    /*if scarred = 1{
        //drawing kill/explosion scars
        draw_sprite(spexplosionscars,scarno,x,y)
        }*/
    if bordern = 1{
        //draw_sprite(bordersprite,0,x,y)
        }
    if bordere = 1{
        //draw_sprite(bordersprite,1,x,y)
        }
    if borders = 1{
        //draw_sprite(bordersprite,2,x,y)
        }
    if borderw = 1{
        //draw_sprite(bordersprite,3,x,y)
        }
    if safetyborder = 1{
        if safetyn = 1{
            draw_sprite(stilesafetytape,0,x,y)
            }
        if safetye = 1{
            draw_sprite(stilesafetytape,1,x,y)
            }
        if safetys = 1{
            draw_sprite(stilesafetytape,2,x,y)
            }
        if safetyw = 1{
            draw_sprite(stilesafetytape,3,x,y)
            }
        }
    
    if drawaxislines = 1{
        if onxaxis = 1{
            draw_sprite(cursoraxisline,2,x,y)
            }
        if onyaxis = 1{
            draw_sprite(cursoraxisline,1,x,y)
            }
        }
    if drawshadow = 1{
        drawshadow = 0
        sTileDrawShadow()
        }
    }

/* */
/*  */
