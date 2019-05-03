//determine center of screen

menuwidth = 100
menuheight = 100

sMenuGetRoomCoordinates(0,0)
//make menu buttons
var vx,vy,vbutton;
vx = x+10
vy = y+10
vbutton = instance_create(vx,vy,oMenuPauseResumeButton)
vbutton.parent = id
vbutton.depth = depth-1
with vbutton{
    event_perform(ev_other,ev_user15)//button position init, probably unnecessary
    }
vy += 30

vbutton = instance_create(vx,vy,oMenuPauseSettingsButton)
vbutton.parent = id
vbutton.depth = depth-1
with vbutton{
    event_perform(ev_other,ev_user2)
    event_perform(ev_other,ev_user15)
    }
vy += 30

vbutton = instance_create(vx,vy,oMenuPauseQuitButton)
vbutton.parent = id
vbutton.depth = depth-1
with vbutton{
    event_perform(ev_other,ev_user2)
    event_perform(ev_other,ev_user15)
    }
vy += 30

gnoise = sStartGNoise(menuwidth,menuheight,2,0.3,7,c_black,c_gray)


