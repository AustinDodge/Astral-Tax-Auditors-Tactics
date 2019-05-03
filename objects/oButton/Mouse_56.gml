if canbeclicked = 1{//if this button currently can be clicked
    if clicked = 1{//if this button was clicked on
        //if collision_point(imouse_x,imouse_y,id,0,0){//and the mouse is still on the button
        if mouseon = 1{
            mouse_clear(mb_left)
            event_perform(ev_other,ev_user0)//all children have code for what to do when clicked in user 0
            }
        }
    }
clicked = 0

