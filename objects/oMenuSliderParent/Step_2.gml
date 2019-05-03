
mouseoverslider = 0//assume the player isn't over the slider
//currently there is leeway as to if the mouse is over the slider bar
if imouse_x >= colx1{
    if imouse_x <= colx2{
        if imouse_y >= coly1{
            if imouse_y <= coly2{
                mouseoverslider = 1
                }
            }
        }
    }
    
if mouseoverslider = 1{
    if mouse_check_button_pressed(mb_left){
        movingslider = 1
        }
    }

if mouse_check_button_released(mb_left){
    movingslider = 0
    }
if movingslider = 1{
    sliderposition = imouse_x - sliderx
    if sliderposition < 0{
        sliderposition = 0
        }
    if sliderposition > sliderlength{
        sliderposition = sliderlength
        }
    }




















