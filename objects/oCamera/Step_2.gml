if canmovecamera = 1{
    if keyboard_check(vk_left){
    //    view_xview[0] -= 2
        x -= 3
        }
    if keyboard_check(vk_right){
        //view_xview[0] += 2
        x += 3
        }
    if keyboard_check(vk_up){
        //view_yview[0] -= 2
        y -= 3
        }
    if keyboard_check(vk_down){
        //view_yview[0] += 2
        y += 3
        }        
    }
    
if cameratargeting = 1{//if the camera is moving towards a target set by another object
    if abs(targetx - x) <= xborder{//check if it's close enough
        targetx = x
        }
    if abs(targety - y) <= yborder{
        targety = y
        }
        
    if abs(targetx - x) < targetspeed{//set it to the target so there's no bouncing
        x = targetx
        }
    if abs(targety - y) < targetspeed{
        y = targety
        }
    
    if targetx > x{//move towards the target
        x += targetspeed
        }
    if targetx < x{
        x -= targetspeed
        }
    if targety > y{
        y += targetspeed
        }
    if targety < y{
        y -= targetspeed
        }
    
    if x = targetx and y = targety{//done moving
        cameratargeting = 0
        }
    }




camera_set_view_pos(maincameraid,x-(round(halfvieww/viewdiv)),y-round(halfviewh/viewdiv))



//wsize = ceil(wreal/viewdiv)//the resolution at which the game will be drawn
//hsize = ceil(hreal/viewdiv)

//camrealwidth = wsize
//camrealheight = hsize




