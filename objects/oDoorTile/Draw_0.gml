var vind,vspr,vcolor;

if drawme = 1{
    vind = screenind
    tramtype = 0
    if door = exitdoor{
        tramtype = 2
        if exitlocked = 0{
            tramtype = 1
            }
        }
    vcolor = c_white
    if fallfadestage != 0{
        vcolor = merge_color(c_white,c_black,fallfadestage/fallfadesteps)
        }
    switch tramtype{
        case 1:vind += 6; break;
        case 2: vind += 12; break;
        }
    if door = 1 or door = 3{
        vspr = elevatortilenscut
        }else{
        vspr = elevatortileewcut
        }
    draw_sprite(vspr,vind,x,y)
    draw_sprite_ext(selevatorbordernesw,borderind,x,y,1,1,0,vcolor,1)
    
    /*if scarred = 1{
        //drawing kill/explosion scars
        draw_sprite(spexplosionscars,scarno,x,y)
        }*/
    
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
