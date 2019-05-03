if imouse_y < y{//if the mouse is above the arrow
    if imouse_x < x{
        myfacing = 0
        }else{
        myfacing = 1
        }
    }else{
    if imouse_x < x{
        myfacing = 3
        }else{
        myfacing = 2
        }
    }
    
if instance_exists(myunit){
    myunit.facing = myfacing
    }

