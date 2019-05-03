x = camera_get_view_x(maincameraid)
y = camera_get_view_y(maincameraid)

//these are now set in oPauseControl
/*couldclick = canclick
couldmovecamera = canmovecamera

canclick = 0
canmovecamera = 0
pausemove = 1
menucolor = c_gray
menuopacity = 0.7
*/

menucolor = oPauseControl.menucolor
menuopacity = oPauseControl.menuopacity

menuwidth = 0//the dimensions of the menu object itself
menuheight = 0

cornerx = 0//upper left corner of the menu item
cornery = 0




event_perform(ev_other,ev_user0)//object specific init stuff

