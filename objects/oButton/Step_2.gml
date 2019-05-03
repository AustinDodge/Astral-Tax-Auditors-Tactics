

if parent > 0{
    if instance_exists(parent){
        x = parent.x+dx
        y = parent.y+dy
        }
    }
mouseon = 0
if collision_point(imouse_x,imouse_y,id,0,0){
    glowing = 1
    mouseon = 1
    }
    
if canglow = 1{
    if glowing = 1{
        if glowon = 1{
            glowalpha += .1
            if glowalpha < 0.5{//get up to minimum glow faster
                glowalpha += .1
                }
            }else{
            if mouseon = 1{
                glowalpha -= .1
                }else{
                glowalpha -= 0.2//go to no glow faster
                }
            }
        if glowalpha >= 1{
            glowon = 0
            }
        if glowalpha <= .5 and mouseon = 1{
            glowon = 1
            }
        if mouseon = 0{
            glowon = 0
            }
            
        if glowalpha = 0{
            glowing = 0
            }
        }
    if glowalpha < 0{
        glowalpha = 0
        }
    }
    


