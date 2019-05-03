if drawme = 1{
    draw_self()
    /*if scarred = 1{
        //drawing kill/explosion scars
        draw_sprite(spexplosionscars,scarno,x,y)
        }*/
    if bordern = 1{
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
    if mydressing > 0{
        with mydressing{
            draw_self()
            }
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
        }
    if drawshadow = 1{
        drawshadow = 0
        sTileDrawShadow()
        }
    if onmovepath = 1{
        //sTileDrawMovePath()
        }
    }

/* */
/*  */
