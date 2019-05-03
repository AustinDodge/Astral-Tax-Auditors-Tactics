//if collision_point(imouse_x,imouse_y,id,0,0) = id{
if dunit = myunit{
    mouseover = 1
    //pulseon = 1
    //inorout = 1
    //image_index = 1
    //image_speed = -0.5
    }else{
    mouseover = 0
    }

if mouseover = 0{
    
    //image_speed = 0.5
    /*
    if pulseon = 1{
        if inorout = 1{
            image_speed = -0.5
            //pulsing out
            //image_index -= 1
            if image_index = 0{
                pulseon = 0
                alarm[0] = alarmlength
                image_speed = 0
                }
            }else{
            //pulsing in
            //image_index += 1
            image_speed = 0.5
            if image_index = sprite_get_number(sprite_index)-1{
                inorout = 1
                }
            }
        }*/
    sprite_index = sphealcursordef
    image_speed = 0
    image_index = oIconControl.attackindex
    }else{
    sprite_index = sphealcursorhover
    image_speed = 0.3
    }

/* */
/*  */
