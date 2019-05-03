if moving = 1{
    y += 6
    }
if alarmon = 0{
    if y >= __view_get( e__VW.YView, 0 ) + camrealheight/2{
        alarmon = 1
        alarm[0] = 20
        moving = 0
        }
    }
if y > (__view_get( e__VW.YView, 0 ) + oCamera.hreal + sprite_height){
    instance_destroy()
    }

