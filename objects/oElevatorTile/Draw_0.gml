if drawme = 1{
    if animating = 1 or elevation > lowelevation{
        var vy,vnum;
        vy = y
        vnum = elevation - lowelevation
        if goingup = 1{
            vnum += 1
            }
        vy = y+(vnum*elevheight)
        while vnum > 0{
            draw_sprite(spelevatorcolumn,1,x,vy)
            vnum -= 1
            vy -= elevheight
            }
        }
    draw_sprite(spelevatorcolumn,0,basex,basey)
    /*if elevation > lowelevation{//if the elevator is up, draw the columns under it
        var vy,vnum;
        vy = y + ((elevation - lowelevation)*elevheight)
        vnum = elevation - lowelevation
        while vnum > 0{
            vnum -= 1
            draw_sprite(spelevatorcolumn,1,x,vy)
            vy -= elevheight
            }
        }*/
    //if goingup = 1{//if the elevator is currently animating going up
    //    var vy;
    //    vy = y + (
    draw_self()//then draw the elevator tile sprite
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
