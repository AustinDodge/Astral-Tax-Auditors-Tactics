

//dx = view_xview[0] + ceil(camrealwidth/viewdiv)
//dy = view_yview[0] + ceil(camrealheight/viewdiv)

//dx = view_xview[0] + camrealwidth
dx = camera_get_view_x(maincameraid)
dy = camera_get_view_y(maincameraid) + camrealheight

/*if up = 1{
    if my > upy{
        my -= 6
        }else{
        my = upy
        }
    }else{
    if my < 0{
        my += 6
        }else{
        my = 0
        }
    }
dy += my*/

x = dx
y = dy

//dx -= ceil(100)
//dy -= ceil(100)

